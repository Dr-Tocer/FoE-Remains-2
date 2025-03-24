extends CharacterBody2D

@onready var animation_player = $AnimationPlayer#获取角色动画节点
enum State { right_IDLE, right_WALK, JUMP ,left_WALK,left_IDLE}# 角色状态组
var current_state#玩家当前状态
@export var speed:float = 400 #最大移动速度
@export var acceleration:float = 30 #移动加速度
@export var jump_velocity:float = -1350 #跳跃最大速度
@export var G_coefficient_when_drop:float = 4 #角色重力加速度
var G = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_dropping:bool
var 跳跃蓄力值:float = 0
var 跳跃蓄力速度:float = 100
var 跳跃就绪状态:bool = true
func _ready() -> void:
	pass

func _physics_process(delta):
	#--------------按键与状态绑定-------------------
	if Input.is_action_pressed("ui_right") and is_on_floor():
		current_state = State.right_WALK
	elif Input.is_action_pressed("ui_left") and is_on_floor():
		current_state = State.left_WALK
	elif Input.is_action_just_pressed("ui_accept"):
		current_state = State.JUMP
	else:
		if current_state == State.right_WALK:
			current_state = State.right_IDLE
		elif current_state == State.left_WALK:
			current_state = State.left_IDLE
	pass

	#---------------状态与动画绑定--------------------
	match current_state:
		State.right_IDLE:
			animation_player.play("休息向右")
		State.left_IDLE:
			animation_player.play("休息向左")
		State.right_WALK:
			animation_player.play("向右行走")
		State.left_WALK:
			animation_player.play("向左行走")
		State.JUMP:
			animation_player.play("向右跳跃")
		pass

	#----------------移动系统-----------------------
	if Input.get_action_strength("ui_accept") != 0 and is_on_floor() and 跳跃就绪状态:
		跳跃蓄力值 = move_toward(跳跃蓄力值,jump_velocity,跳跃蓄力速度)
		pass
	if Input.is_action_just_released("ui_accept"):
		跳跃就绪状态 = true
	if Input.is_action_just_released("ui_accept") and not is_dropping:
		velocity.y = 跳跃蓄力值
		跳跃蓄力值 = 0
	if is_dropping and 跳跃蓄力值 == jump_velocity:
		跳跃就绪状态 = false
		velocity.y = 跳跃蓄力值
		跳跃蓄力值 = 0
		pass
	if is_on_floor():
		is_dropping = false
	if not is_on_floor():
		
		Drop(delta)
	
	move()
	move_and_slide()
	
func move():
	var direction = Input.get_axis("ui_left","ui_right")
	if direction != 0 :#角色移动速度从当前速度通过加速度到目标速度
		if direction > 0 and is_on_floor():
			velocity.x = move_toward(velocity.x,speed,acceleration)#（角色当前速度，目标速度，加速度）
		elif direction < 0 and is_on_floor():
			velocity.x = move_toward(velocity.x,-speed,acceleration)
		elif direction > 0 and not is_on_floor():
			velocity.x = move_toward(velocity.x,speed,acceleration/3)
		elif direction < 0 and not is_on_floor():
			velocity.x = move_toward(velocity.x,-speed,acceleration/3)
	else:
		if is_on_floor(): #阻力，数值越大越停下约快。
			velocity.x = move_toward(velocity.x,0,60)#地面阻力
		else:
			velocity.x = move_toward(velocity.x,0,1)#空气阻力
	pass

func jump():
	velocity.y = jump_velocity
	pass

func Drop(delta):
	if velocity.y <= 0:
		is_dropping = false
		pass

	elif velocity.y > 0:
		is_dropping = true
		pass
	velocity.y += G * G_coefficient_when_drop * delta
	#print(G * G_coefficient_when_drop * delta)
	
