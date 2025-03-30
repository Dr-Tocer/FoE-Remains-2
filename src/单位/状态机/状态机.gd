extends Node
class_name 状态机
var 当前状态 : String = "待机"
var 变更状态 : String = "待机"
var 朝向:bool = true
func _physics_process(_delta: float) -> void:
	切换状态()
	朝向切换()
	#print(朝向)
	pass
func 切换状态():
	if 当前状态 != 变更状态 :
		get_node(当前状态).退出状态()
		当前状态 = 变更状态
		get_node(当前状态).进入状态()
	pass
func 朝向切换():
	if Input.is_action_pressed("左摇杆向右"):
		朝向 = true
	elif Input.is_action_pressed("左摇杆向左"):
		#print("成功")
		朝向 = false
	pass
