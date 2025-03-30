extends Node
class_name 攀附
@onready var entity = get_parent().get_parent() if get_parent() else null
@onready var 状态机 = get_parent()
var 能否攀附 :bool = false

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
	if 状态机.当前状态 == name and 状态机.朝向 == true and entity.get_node("区域检测").右侧 and not entity.get_node("区域检测").右上 and not entity.get_node("区域检测").下方:
		entity.animation_player.play("向右攀附")
	elif 状态机.当前状态 == name and 状态机.朝向 == false and entity.get_node("区域检测").左侧 and not entity.get_node("区域检测").左上 and not entity.get_node("区域检测").下方:
		entity.animation_player.play("向左攀附")
		pass
	pass
	
func 玩家进入状态条件():
	if (entity.get_node("区域检测").右侧 and not entity.get_node("区域检测").右上 and not entity.get_node("区域检测").下方) or (entity.get_node("区域检测").左侧 and not entity.get_node("区域检测").左上 and not entity.get_node("区域检测").下方):
		能否攀附 = true
	else:
		能否攀附 = false
	pass
	
func NPC进入状态条件():
	
	pass
