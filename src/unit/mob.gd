extends CharacterBody2D
var G = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var G_coefficient_when_drop:float = 2 #角色重力加速度
@export_enum("player","NPC","Trap") var character_type : String
@onready var animation_player = $AnimationPlayer
@export var speed:float = 400 #基础移动速度
@export var 奔跑速度:float = 800
@export var 匍匐速度:float = 260
@export var acceleration:float = 50 #移动加速度
@export var jump_velocity:float = -1000 #跳跃最大速度
@export var 跳跃蓄力速度:float = 75
@export var 地面阻力:int = 50
@export var 空气阻力:int = 1
var 实际速度 :float = speed
var 跳跃蓄力值 :float = 0
var 跳跃就绪状态 :bool = true
var 攀附状态 :bool = false
var 攀附跳跃 :bool = false
var direction : int = 0
var jump_signal : bool = false #NPC跳跃信号
func _ready() -> void:
	pass
func _physics_process(delta):
	if not is_on_floor():
		重力系统(delta)
	移动系统()
	if character_type == "player":
		玩家跳跃系统()
		玩家攀附系统()
		玩家跨越系统()
	move_and_slide()

	pass
func 重力系统(delta):
	velocity.y += G * G_coefficient_when_drop * delta
func 移动系统():
	if direction != 0 :#角色移动速度从当前速度通过加速度到目标速度
		if direction > 0 and is_on_floor():
			velocity.x = move_toward(velocity.x,实际速度,acceleration)#（角色当前速度，目标速度，加速度）
		elif direction < 0 and is_on_floor():
			velocity.x = move_toward(velocity.x,-实际速度,acceleration)
		elif direction > 0 and not is_on_floor():
			velocity.x = move_toward(velocity.x,实际速度,acceleration/5)
		elif direction < 0 and not is_on_floor():
			velocity.x = move_toward(velocity.x,-实际速度,acceleration/5)
	else:
		if is_on_floor(): #阻力，数值越大越停下约快。
			velocity.x = move_toward(velocity.x,0,地面阻力)#地面阻力
		else:
			velocity.x = move_toward(velocity.x,0,空气阻力)#空气阻力
	pass
func 玩家跳跃系统():
	if Input.get_action_strength("A") != 0 and is_on_floor() and 跳跃就绪状态 and not get_node("区域检测").上方区域 :
		跳跃蓄力值 = move_toward(跳跃蓄力值,jump_velocity,跳跃蓄力速度)
	if Input.is_action_just_released("A") and is_on_floor() and not get_node("区域检测").上方区域:
		if 跳跃蓄力值 < 0.6 * jump_velocity:
			velocity.y = 跳跃蓄力值
			跳跃蓄力值 = 0
			跳跃就绪状态 = false
		else :
			velocity.y = 0.6 * jump_velocity
			跳跃蓄力值 = 0
			跳跃就绪状态 = false
	if Input.is_action_just_released("A"): #松开跳跃键才能再次跳跃
		跳跃就绪状态 = true
func 玩家攀附系统():
	if Input.is_action_pressed("A") and not is_on_floor() and not 攀附状态 and $"状态机/攀附".能否向右攀附 and $"状态机".朝向:
		var X :int = $"区域检测/右侧区域".get_collision_point().x
		var Y :int
		if $"区域检测/右侧区域".get_collision_point().y > 0 :
			Y = $"区域检测/右侧区域".get_collision_point().y/40
			Y = (Y)*40
		else:
			Y = ($"区域检测/右侧区域".get_collision_point().y)/40
			Y = (Y-1)*40
		self.global_transform.origin = Vector2(X-46,Y+28)
		$"状态机".变更状态 = "攀附"
		攀附状态 = true
	elif Input.is_action_pressed("A") and not is_on_floor() and not 攀附状态 and $"状态机/攀附".能否向左攀附 and not $"状态机".朝向:
		var X :int = $"区域检测/左侧区域".get_collision_point().x
		var Y :int
		if $"区域检测/左侧区域".get_collision_point().y > 0 :
			Y = $"区域检测/左侧区域".get_collision_point().y/40
			Y = (Y)*40
		else:
			Y = ($"区域检测/左侧区域".get_collision_point().y)/40
			Y = (Y-1)*40
		self.global_transform.origin = Vector2(X+46,Y+28)
		$"状态机".变更状态 = "攀附"
		攀附状态 = true
		pass
	if 攀附状态:
		velocity = Vector2.ZERO
		G = 0
		if Input.get_action_strength("A") != 0 and 攀附跳跃:
			跳跃蓄力值 = move_toward(跳跃蓄力值,jump_velocity,跳跃蓄力速度)
		if Input.is_action_just_released("A") and 攀附跳跃:
			velocity.y = 跳跃蓄力值
			跳跃蓄力值 = 0
			攀附状态 = false
			攀附跳跃 = false
			G = ProjectSettings.get_setting("physics/2d/default_gravity")
			if Input.is_action_pressed("左摇杆向左"):
				velocity.x = -speed
			elif Input.is_action_pressed("左摇杆向右"):
				velocity.x = speed
		elif Input.is_action_just_released("A"):
			攀附跳跃 = true
		if Input.is_action_just_pressed("左摇杆向下"):
			攀附状态 = false
			攀附跳跃 = false
			G = ProjectSettings.get_setting("physics/2d/default_gravity")
		if Input.is_action_just_pressed("左摇杆向上"):
			
			direction = 0
			if not $"区域检测".右上攀爬四格区域 and $"状态机".朝向:
				$"状态机".变更状态 = "待机"
				攀附状态 = false
				攀附跳跃 = false
				G = ProjectSettings.get_setting("physics/2d/default_gravity")
				var X :int = $"区域检测/右侧区域".get_collision_point().x
				var Y :int
				if $"区域检测/右侧区域".get_collision_point().y > 0 :
					Y = $"区域检测/右侧区域".get_collision_point().y/40
					Y = (Y)*40
				else:
					Y = ($"区域检测/右侧区域".get_collision_point().y)/40
					Y = (Y-1)*40
				self.global_transform.origin = Vector2(X,Y-60)
			elif not $"区域检测".左上攀爬四格区域 and not $"状态机".朝向:
				$"状态机".变更状态 = "待机"
				攀附状态 = false
				攀附跳跃 = false
				G = ProjectSettings.get_setting("physics/2d/default_gravity")
				var X :int = $"区域检测/左侧区域".get_collision_point().x
				var Y :int
				if $"区域检测/左侧区域".get_collision_point().y > 0 :
					Y = $"区域检测/左侧区域".get_collision_point().y/40
					Y = (Y)*40
				else:
					Y = ($"区域检测/左侧区域".get_collision_point().y)/40
					Y = (Y-1)*40
				self.global_transform.origin = Vector2(X,Y-60)
			elif not $"区域检测". 右上爬行区 and $"状态机".朝向:
				get_node("匍匐碰撞箱").disabled = false
				get_node("默认碰撞箱").disabled = true
				$"状态机".变更状态 = "匍匐"
				攀附状态 = false
				攀附跳跃 = false
				G = ProjectSettings.get_setting("physics/2d/default_gravity")
				var X :int = $"区域检测/右侧区域".get_collision_point().x
				var Y :int
				if $"区域检测/右侧区域".get_collision_point().y > 0 :
					Y = $"区域检测/右侧区域".get_collision_point().y/40
					Y = (Y)*40
				else:
					Y = ($"区域检测/右侧区域".get_collision_point().y)/40
					Y = (Y-1)*40
				self.global_transform.origin = Vector2(X,Y-60)
			elif not $"区域检测". 左上爬行区 and not $"状态机".朝向:
				get_node("匍匐碰撞箱").disabled = false
				get_node("默认碰撞箱").disabled = true
				$"状态机".变更状态 = "匍匐"
				攀附状态 = false
				攀附跳跃 = false
				G = ProjectSettings.get_setting("physics/2d/default_gravity")
				var X :int = $"区域检测/左侧区域".get_collision_point().x
				var Y :int
				if $"区域检测/左侧区域".get_collision_point().y > 0 :
					Y = $"区域检测/左侧区域".get_collision_point().y/40
					Y = (Y)*40
				else:
					Y = ($"区域检测/左侧区域".get_collision_point().y)/40
					Y = (Y-1)*40
				self.global_transform.origin = Vector2(X,Y-60)
func 玩家跨越系统():
	if not $区域检测.腿部右上 and $区域检测.腿部右侧 and $状态机.朝向 and Input.get_action_strength("左摇杆向上") != 0:
		var Y :int
		if $"区域检测/腿部右侧区域".get_collision_point().y > 0 :
			Y = $"区域检测/腿部右侧区域".get_collision_point().y/40
			Y = (Y)*40
		else:
			Y = ($"区域检测/腿部右侧区域".get_collision_point().y)/40
			Y = (Y-1)*40
		self.global_transform.origin.y = $"区域检测/右侧跨越检测".get_collision_point().y - 60
		self.global_transform.origin.x = $"区域检测/腿部右侧区域".get_collision_point().x
		velocity.y = 0
		if velocity.x > 0 :
			velocity.x = speed
	elif not $区域检测.腿部左上 and $区域检测.腿部左侧 and not $状态机.朝向 and Input.get_action_strength("左摇杆向上") != 0:
		var Y :int
		if $"区域检测/腿部左侧区域".get_collision_point().y > 0 :
			Y = $"区域检测/腿部左侧区域".get_collision_point().y/40
			Y = (Y)*40
		else:
			Y = ($"区域检测/腿部左侧区域".get_collision_point().y)/40
			Y = (Y-1)*40
		self.global_transform.origin.y = $"区域检测/左侧跨越检测".get_collision_point().y - 60
		self.global_transform.origin.x = $"区域检测/腿部左侧区域".get_collision_point().x
		velocity.y = 0
		if velocity.x < 0 :
			velocity.x = -speed
	pass
