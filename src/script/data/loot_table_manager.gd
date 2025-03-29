class_name FOELootTableManager
extends RefCounted


var cache_dict: Dictionary = {}


func get_loot_table(id: String):
	pass

func load_loot_table_path(path: String) -> void:
	var dir = DirAccess.open(path)
	if dir:
		for f in dir.get_files():
			load_loot_table(path + f)
	else:
		printerr("初始化目录 %s 下的战利品表失败！" % dir)

func load_loot_table(path: String) -> void:
	var loot_table_obj = FOELootTable.new(FOEUtils.load_json(path))
	cache_dict[loot_table_obj.id] = loot_table_obj
		
func bootstrap() -> void:
	load_loot_table_path(C.INTERNAL_LOOT_TABLE_PATH)
