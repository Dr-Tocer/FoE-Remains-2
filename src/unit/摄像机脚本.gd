extends Camera2D
@onready var mob = get_parent().get_node("Mob")
var X :float
var Y :float
func _physics_process(delta):
	X = abs(self.position.x - mob.position.x)/10
	Y = abs(self.position.y - mob.position.y)/10
	self.position.x = move_toward( self.position.x , mob.position.x , X )
	self.position.y = move_toward( self.position.y , mob.position.y , Y )
	pass
