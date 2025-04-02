extends Camera2D
var 自定义光标 = Sprite2D.new()
var 鼠标位置: Vector2
var 跟随鼠标 := false
@onready var mob = get_parent().get_node("Mob")
var X :float
var Y :float
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	自定义光标.texture = preload("res://素材库/GUI/光标.png")
	自定义光标.z_index = 999
	add_child(自定义光标)
	pass

func _physics_process(delta:float):
	自定义光标.global_position = get_global_mouse_position()
	if not 跟随鼠标 :
		X = abs(self.position.x - mob.position.x)/8
		Y = abs(self.position.y - mob.position.y)/8
		self.position.x = move_toward( self.position.x , mob.position.x , X )
		self.position.y = move_toward( self.position.y , mob.position.y , Y )
		pass
	
	if Input.is_action_pressed("LT"):
		if not 跟随鼠标:
			鼠标位置 = get_global_mouse_position()
			跟随鼠标 = true
			pass
		elif 跟随鼠标:
			X = abs(self.global_position.x - 鼠标位置.x)/8
			Y = abs(self.global_position.y - 鼠标位置.y)/8
			if X*X + Y*Y >= 4 :
				self.global_position.x = move_toward( self.global_position.x , 鼠标位置.x , X )
				self.global_position.y = move_toward( self.global_position.y , 鼠标位置.y , Y )
				Input.warp_mouse(Vector2(move_toward( get_viewport().get_mouse_position().x , get_viewport().size.x/2 , X ), move_toward( get_viewport().get_mouse_position().y , get_viewport().size.y/2 , Y )))
			鼠标位置 = get_global_mouse_position()
			pass
	else:
		跟随鼠标 = false
		pass
