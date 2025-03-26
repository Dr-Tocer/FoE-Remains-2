extends CharacterBody2D
var 玩家位置
@onready var animation_player = $AnimationPlayer#获取角色动画节点
enum State { 向右休息,向右行走,向右跳跃,向右上行,向右下行,向右爬行,向右奔跑,向右站立,向右翻滚,向右站立持枪,向右攀爬,向右攀附,向右坠落,向左休息,向左行走,向左跳跃,向左上行,向左下行,向左爬行,向左奔跑,向左站立,向左翻滚,向左站立持枪,向左攀爬,向左坠落,向左攀附}# 角色行动状态组
var current_state#玩家当前状态
@export var speed:float = 400 #基础移动速度
@export var 奔跑增加速度:float = 400
@export var acceleration:float = 30 #移动加速度
@export var jump_velocity:float = -1100 #跳跃最大速度
@export var G_coefficient_when_drop:float = 2.6 #角色重力加速度
var G = ProjectSettings.get_setting("physics/2d/default_gravity")
var 实际速度:float = speed
var is_dropping:bool #是否在下落
var 奔跑状态:bool = false
var 跳跃蓄力值:float = 0
var 跳跃蓄力速度:float = 150
var 跳跃就绪状态:bool = true
var 攀爬状态 : bool = false
var 朝向 : bool = true #true为右，false为左
var 左上 : bool #角色附近区域障碍物检测，有为true，无为false
var 左侧 : bool
var 右上 : bool
var 右侧 : bool
var 下方 : bool

func _ready() -> void:
	pass

func _physics_process(delta):
	按键与状态绑定()
	状态与动画绑定()
	if not 攀爬状态:
		移动系统()
	攀爬系统()
	跳跃系统()
	if not is_on_floor():
		重力系统(delta)
	move_and_slide()
#-----------------攀附系统-------------------
func  攀爬系统():
	if Input.is_action_pressed("A") and current_state == State.向右攀附 and not is_on_floor() and not 攀爬状态 and 朝向:
		var X :int
		var Y :int
		if $"右侧区域".get_collision_point().y > 0 :
			X = $"右侧区域".get_collision_point().x
			Y = $"右侧区域".get_collision_point().y/40
			Y = (Y)*40
		elif $"右侧区域".get_collision_point().y < 0 :
			X = $"右侧区域".get_collision_point().x
			Y = ($"右侧区域".get_collision_point().y)/40
			Y = (Y-1)*40

		self.global_transform.origin = Vector2(X-130,Y-70)
		animation_player.play("向右攀附")
		攀爬状态 = true
		
	if Input.is_action_pressed("A") and current_state == State.向左攀附 and not is_on_floor() and not 攀爬状态 and not 朝向:
		var X :int
		var Y :int
		if $"左侧区域".get_collision_point().y > 0 :
			X = $"左侧区域".get_collision_point().x
			Y = $"左侧区域".get_collision_point().y/40
			Y = (Y)*40
		elif $"左侧区域".get_collision_point().y < 0 :
			X = $"左侧区域".get_collision_point().x
			Y = ($"左侧区域".get_collision_point().y)/40
			Y = (Y-1)*40

		self.global_transform.origin = Vector2(X-48,Y-70)
		animation_player.play("向左攀附")
		攀爬状态 = true
		
		pass
	if 攀爬状态:
		velocity = Vector2.ZERO
		G = 0
		
		if Input.is_action_just_pressed("左摇杆向下"):
			攀爬状态 = false
			G = ProjectSettings.get_setting("physics/2d/default_gravity")
		pass
	右上 = $"右上区域".is_colliding()
	右侧 = $"右侧区域".is_colliding()
	左上 = $"左上区域".is_colliding()
	左侧 = $"左侧区域".is_colliding()
	下方 = $"下方区域".is_colliding()
	
	#####
	print(跳跃就绪状态)
	#####
#------------------移动系统------------------------
func 移动系统():
	var direction = Input.get_axis("左遥杆向左","左遥杆向右")
	if direction != 0 :#角色移动速度从当前速度通过加速度到目标速度
		if direction > 0 and is_on_floor():
			velocity.x = move_toward(velocity.x,实际速度,acceleration)#（角色当前速度，目标速度，加速度）
		elif direction < 0 and is_on_floor():
			velocity.x = move_toward(velocity.x,-实际速度,acceleration)
		elif direction > 0 and not is_on_floor():
			velocity.x = move_toward(velocity.x,实际速度,acceleration/3)
		elif direction < 0 and not is_on_floor():
			velocity.x = move_toward(velocity.x,-实际速度,acceleration/3)
	else:
		if is_on_floor(): #阻力，数值越大越停下约快。
			velocity.x = move_toward(velocity.x,0,60)#地面阻力
		else:
			velocity.x = move_toward(velocity.x,0,1)#空气阻力
	if Input.is_action_pressed("左摇杆按压") and (Input.is_action_pressed("左遥杆向左") or Input.is_action_pressed("左遥杆向右")) and is_on_floor() and not 奔跑状态:
		实际速度 += 奔跑增加速度
		奔跑状态 = true
		
	if Input.is_action_just_released("左摇杆按压") and 奔跑状态:
		实际速度 -= 奔跑增加速度
		奔跑状态 = false
	pass
#---------------重力系统-----------------
func 重力系统(delta):
	if velocity.y <= 0:
		is_dropping = false
		pass
	elif velocity.y > 0:
		is_dropping = true
		pass
	if is_on_floor():
		is_dropping = false
	velocity.y += G * G_coefficient_when_drop * delta
	#print(G * G_coefficient_when_drop * delta)
	
#-------------------跳跃系统------------------------
func 跳跃系统():
	if Input.get_action_strength("A") != 0 and is_on_floor() and 跳跃就绪状态:
		跳跃蓄力值 = move_toward(跳跃蓄力值,jump_velocity,跳跃蓄力速度)
		pass
	if Input.is_action_just_released("A") and not is_dropping and is_on_floor():#必须放在松开才能再次起跳功能前
		velocity.y = 跳跃蓄力值
		跳跃蓄力值 = 0
		跳跃就绪状态 = false
	if Input.is_action_just_released("A") and not 攀爬状态: #松开跳跃键才能再次跳跃
		跳跃就绪状态 = true
	if is_dropping and 跳跃蓄力值 < -跳跃蓄力速度:
		跳跃就绪状态 = false
		velocity.y = 跳跃蓄力值
		跳跃蓄力值 = 0
		pass
#--------------按键与状态绑定-------------------
func 按键与状态绑定():
	if Input.is_action_pressed("左遥杆向右"):
		朝向 = true
	elif Input.is_action_pressed("左遥杆向左"):
		朝向 = false
	elif Input.is_action_pressed("左遥杆向右") and is_on_floor():
		current_state = State.向右行走
	elif Input.is_action_pressed("左遥杆向左") and is_on_floor():
		current_state = State.向左行走
	elif Input.is_action_pressed("左摇杆按压") and Input.is_action_pressed("左遥杆向左") and is_on_floor():
		current_state = State.向左奔跑
	elif Input.is_action_pressed("左摇杆按压") and Input.is_action_pressed("左遥杆向右") and is_on_floor():
		current_state = State.向右奔跑
	elif 朝向 and not is_on_floor() and not is_dropping and not 攀爬状态 and velocity.y < -500:
		current_state = State.向右跳跃
	elif not 朝向 and not is_on_floor() and not is_dropping and not 攀爬状态 and velocity.y < -500:
		current_state = State.向左跳跃
	elif 右侧 and not 右上 and not 下方:
		current_state = State.向右攀附
	elif 左侧 and not 左上 and not 下方:
		current_state = State.向左攀附
	elif is_dropping and 朝向 and not 攀爬状态 and velocity.y > 400 and not 下方:
		current_state = State.向右坠落
	elif is_dropping and not 朝向 and not 攀爬状态 and velocity.y > 400 and not 下方:
		current_state = State.向左坠落
	else:
		if 朝向 and is_on_floor():
			current_state = State.向右休息
		elif not 朝向 and is_on_floor():
			current_state = State.向左休息
	pass
#---------------状态与动画绑定--------------------
func 状态与动画绑定():
	match current_state:
		State.向右休息:
			animation_player.play("休息向右")
		State.向左休息:
			animation_player.play("休息向左")
		State.向右行走:
			animation_player.play("向右行走")
		State.向左行走:
			animation_player.play("向左行走")
		State.向右跳跃:
			animation_player.play("向右跳跃")
		State.向左跳跃:
			animation_player.play("向左跳跃")
		State.向右坠落:
			animation_player.play("向右坠落")
		State.向左坠落:
			animation_player.play("向左坠落")
		pass
