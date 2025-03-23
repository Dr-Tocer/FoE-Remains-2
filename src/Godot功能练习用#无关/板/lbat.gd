extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.add_to_group("lbat")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var yu=Input.get_action_strength("左板上")*15
	var yd=Input.get_action_strength("左板下")*15
	var yx= position.y-yu+yd
	if yx > 0 and yx < 1080 :
		position.y=position.y-yu+yd
	
	pass
