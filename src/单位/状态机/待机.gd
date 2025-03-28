extends Node
class_name 待机
@onready var 玩家 = get_parent().get_parent() if get_parent() else null
@onready var 状态机 = get_parent()

func _physics_process(delta: float) -> void:
	更新进程()
	pass
	
func 进入状态():
	
	pass
	
func 退出状态():
	
	pass
	
func 更新进程():
	
	pass
