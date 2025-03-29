class_name FOELootTable
extends RefCounted

var id: FOEIdentity
var _parsed: Dictionary

func _init(id: FOEIdentity, parse_instantly: bool=true) -> void:
	self.id = id
	if parse_instantly:
		self._parsed = FOEUtils.load_json(id.get_file_path(C.LOOT_TABLE))
		
func parse():
	self._parsed = FOEUtils.load_json(id.get_file_path(C.LOOT_TABLE))

func roll() -> Array:
	return []   # TODO
