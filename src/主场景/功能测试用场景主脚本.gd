extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player_scene = load("res://unit/mob.tscn")
	var player_instance = player_scene.instantiate()
	player_instance.position = Vector2(1000, 400)
	add_child(player_instance)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
