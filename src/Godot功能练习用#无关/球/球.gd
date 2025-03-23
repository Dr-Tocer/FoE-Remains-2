extends Area2D
var vec:Vector2=Vector2(5,4)
var delata:Vector2=position

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	for i in get_overlapping_areas():
		if i.is_in_group("upbat"):
			vec.y=-vec.y+0.3
			pass
		if i.is_in_group("downbat"):
			vec.y=-vec.y-0.3
			pass
		if i.is_in_group("bat"):
			reset()
			pass
		if i.is_in_group("lbat"):
			vec.x=-vec.x+0.5
			position.x=25
			Count.con=Count.con+1
			if vec.x>10:
				vec.x=11
				pass
			pass
		if i.is_in_group("rbat"):
			vec.x=-vec.x-0.5
			position.x=1895
			Count.con=Count.con+1
			if vec.x<-10:
				vec.x=-11
				pass
			pass
	self.position=self.position+vec

func reset():
	position=delata
	vec=Vector2(5,4)
	if Count.con > Count.max:
		Count.max=Count.con
	Count.con=0
	pass
