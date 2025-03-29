class_name FOELootTableManager
extends Object

var cache: bool = true
var cache_dict: Dictionary = {}

func get_loot_table(id: String):
	return FOELootTable.new()
