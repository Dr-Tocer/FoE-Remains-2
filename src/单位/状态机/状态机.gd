extends Node
class_name 状态机
var 当前状态 = "待机"
var 变更状态 = "待机"
func _physics_process(delta: float) -> void:
	切换状态()
	pass
func 切换状态():
	if 当前状态 != 变更状态 :
		get_node(当前状态).退出状态()
		当前状态 = 变更状态
		get_node(当前状态).进入状态()
	pass
