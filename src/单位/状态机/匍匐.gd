extends Node
class_name 匍匐
@onready var entity = get_parent().get_parent() if get_parent() else null
@onready var 状态机 = get_parent()

func _physics_process(_delta: float) -> void:
	更新进程()
	pass
	
func 进入状态():
	entity.get_node("匍匐碰撞箱").disabled = false
	entity.get_node("默认碰撞箱").disabled = true
	entity.实际速度 = entity.匍匐速度
	pass
	
func 退出状态():
	entity.get_node("匍匐碰撞箱").disabled = true
	entity.get_node("默认碰撞箱").disabled = false
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
		entity.animation_player.play("向右匍匐")
	elif 状态机.当前状态 == name and 状态机.朝向 == false :
		entity.animation_player.play("向左匍匐")
		pass
	if 状态机.当前状态 != name :
		entity.get_node("匍匐碰撞箱").disabled = true
		entity.get_node("默认碰撞箱").disabled = false
		pass
	if entity and entity.character_type == "player":
		if 状态机.当前状态 == name :
			entity.direction = Input.get_axis("左摇杆向左","左摇杆向右")
	pass
	
func 玩家进入状态条件():
	if Input.is_action_just_pressed("B"):
		状态机.get_node("进入掩体状态计时器").start(0.2)
	if Input.is_action_just_released("B"):
		if 状态机.get_node("进入掩体状态计时器").time_left > 0:
			状态机.get_node("进入掩体状态计时器").stop()
			if 状态机.当前状态 != name :
				状态机.变更状态 = name
				entity.get_node("匍匐碰撞箱").disabled = false
				entity.get_node("默认碰撞箱").disabled = true
			else :
				entity.get_node("匍匐碰撞箱").disabled = true
				entity.get_node("默认碰撞箱").disabled = false
				状态机.变更状态 = "待机"
				pass
			#到时候写进入掩体代码
			pass
	pass
	
func NPC进入状态条件():
	
	pass
func _on_进入掩体计时器_timeout() -> void:
	print("进入掩体")
	pass # Replace with function body.
