extends Node
class_name 待机
@onready var entity = get_parent().get_parent() if get_parent() else null
@onready var 状态机 = get_parent()

func _physics_process(_delta: float) -> void:
	更新进程()
	pass
	
func 进入状态():
	
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
	if 状态机.变更状态 == name and 状态机.朝向 == true :
		entity.animation_player.play("向右待机")
	elif 状态机.变更状态 == name and 状态机.朝向 == false :
		entity.animation_player.play("向左待机")
		pass
	pass
	
func 玩家进入状态条件():
	if entity.velocity == Vector2.ZERO and entity.is_on_floor() and 状态机.当前状态 != "匍匐":
		状态机.变更状态 = name
	pass
func NPC进入状态条件():
	
	pass
