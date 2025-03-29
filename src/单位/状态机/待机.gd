extends Node
class_name 待机
@onready var entity = get_parent().get_parent() if get_parent() else null
@onready var 状态机 = get_parent()

func _physics_process(delta: float) -> void:
	更新进程()
	pass
	
func 进入状态():
	
	pass
	
func 退出状态():
	
	pass
	
func 更新进程():
	if entity and entity is CharacterBody2D :
		玩家进入状态条件()
	else:
		NPC进入状态条件()
		pass
	pass
	
func 玩家进入状态条件():
	if entity.is_on_floor() and 状态机.当前状态 != "匍匐":
		状态机.变更状态 = name
	pass
func NPC进入状态条件():
	
	pass
