class_name FOEContainer
extends FOEObject


var is_locked: bool
var has_alarm: bool
var has_mine: bool
var loot_table: String
var deadlocked: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func init_from_data(data: Dictionary) -> void:
	super.init_from_data(data)
	self.is_locked = randf() < data.get_or_add("lock_chance", 0)
	self.has_alarm = randf() < data.get_or_add("alarm_chance", 0)
	self.has_mine = randf() < data.get_or_add("mine_chance", 0)
	self.loot_table = data.get_or_add("loot_table", "foe2:loot_table/empty")
	self.deadlocked = data.get_or_add("deadlocked", false)
