class_name FOEIdentity
extends RefCounted

var _namespace: StringName = ""
var _path: String = ""
var _cache: String = ""

func _init(id: String) -> void:
	var array = id.split(":", true, 1)
	if array.size() < 2:
		push_error("Invalid FOEIdentity ID: '%s'. Expected format 'namespace:path'." % id)
		array.append("")
	self._namespace = array[0]
	self._path = array[1]
	
func get_file_path(type: String, extension: String = "json", root: String = "res://data", ignore_cache: bool = false) -> String:
	if ignore_cache or !_cache:
		_cache = "%s/%s/%s/%s.%s" % [root, self._namespace, type, self._path, extension]
	return _cache
