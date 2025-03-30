extends Node
var 左上 : bool #角色附近区域障碍物检测，有为true，无为false
var 左侧 : bool
var 右上 : bool
var 右侧 : bool
var 下方 : bool
var 腿部右上 : bool
var 腿部右侧 : bool
var 腿部左上 : bool
var 腿部左侧 : bool
var 后下区域 : bool
var 前下区域 : bool

func _physics_process(delta):
	右上 = get_node("右上区域").is_colliding()
	右侧 = get_node("右侧区域").is_colliding()
	左上 = get_node("左上区域").is_colliding()
	左侧 = get_node("左侧区域").is_colliding()
	下方 = get_node("下方区域").is_colliding()
	腿部右上 = get_node("腿部右上区域").is_colliding()
	腿部右侧 = get_node("腿部右侧区域").is_colliding()
	腿部左上 = get_node("腿部左上区域").is_colliding()
	腿部左侧 = get_node("腿部左侧区域").is_colliding()
	后下区域 = get_node("后下区域").is_colliding()
	前下区域 = get_node("前下区域").is_colliding()
