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
var 左下区域 : bool
var 右下区域 : bool
var 右上爬行区 : bool
var 左上爬行区 : bool
var 上方区域 : bool
var 右上攀爬四格区域 : bool
var 左上攀爬四格区域 : bool
var 右侧腿部边沿状态001 : bool
var 右侧腿部边沿状态002 : bool
var 右侧腿部边沿状态003 : bool
var 左侧腿部边沿状态001 : bool
var 左侧腿部边沿状态002 : bool
var 左侧腿部边沿状态003 : bool
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
	左下区域 = get_node("左下区域").is_colliding()
	右下区域 = get_node("右下区域").is_colliding()
	右上爬行区 = get_node("右上爬行区").is_colliding()
	左上爬行区 = get_node("左上爬行区").is_colliding()
	上方区域 = get_node("上方区域").is_colliding()
	右上攀爬四格区域 = get_node("右上攀爬四格区域").is_colliding()
	左上攀爬四格区域 = get_node("左上攀爬四格区域").is_colliding()
	右侧腿部边沿状态001 = get_node("右侧腿部边沿状态001").is_colliding()
	右侧腿部边沿状态002 = get_node("右侧腿部边沿状态002").is_colliding()
	右侧腿部边沿状态003 = get_node("右侧腿部边沿状态003").is_colliding()
	左侧腿部边沿状态001 = get_node("左侧腿部边沿状态001").is_colliding()
	左侧腿部边沿状态002 = get_node("左侧腿部边沿状态002").is_colliding()
	左侧腿部边沿状态003 = get_node("左侧腿部边沿状态003").is_colliding()
