extends Node
class_name 行走
@onready var entity = get_parent().get_parent() if get_parent() else null
@onready var 状态机 = get_parent()

func _physics_process(_delta: float) -> void:
	更新进程()
	pass
	
func 进入状态():
	entity.实际速度 = entity.speed
	pass
	
func 退出状态():
	
	pass
	
func 更新进程():
	#----------条件
	if entity and entity.character_type == "player":
		玩家进入状态条件()
	else:
		NPC进入状态条件()
		pass
	#----------功能
	if 状态机.当前状态 == name and 状态机.朝向 == true :
		entity.animation_player.play("向右行走")
	elif 状态机.当前状态 == name and 状态机.朝向 == false :
		entity.animation_player.play("向左行走")
		pass
	if entity and entity.character_type == "player":
		if 状态机.当前状态 == name :
			entity.direction = Input.get_axis("左摇杆向左","左摇杆向右")
			pass
	pass
	
func 玩家进入状态条件():
	if (Input.is_action_pressed("左摇杆向右") or Input.is_action_pressed("左摇杆向左")) and entity.is_on_floor() and 状态机.当前状态 != "匍匐" and 状态机.变更状态 != "奔跑" and 状态机.当前状态 != "奔跑":
		状态机.变更状态 = name
	pass
	
func NPC进入状态条件():
	
	pass
