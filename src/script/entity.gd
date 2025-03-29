class_name FOEEntity
extends Node2D

var id: StringName


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func init_from_data(data: Dictionary) -> void:
	self.id = data.get("id")
	var mass: float = data.get("mass")
	if mass > 0:
		$RigidBody2D.set_mass(mass)
	else:
		$RigidBody2D.set_freeze_enabled(true)
