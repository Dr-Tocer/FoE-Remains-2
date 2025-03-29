class_name FOELootTable
extends RefCounted

var id: FOEIdentity
var data: Dictionary

func _init(data: Dictionary) -> void:
	self.id = data.get_or_add("id", "foe2:loot_table/empty")
	self.data = data

func roll() -> Array:
	return []   # TODO
