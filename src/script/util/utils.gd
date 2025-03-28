class_name FOEUtils
extends Object

static var instance: FOEUtils


func _init() -> void:
	instance = self
	print("工具类单例初始化完成")

# 示例JSON解析（结合之前的问题）
static func load_json(path: String) -> Dictionary:
	# 这里可以复用之前的JSON解析代码
	var result = {}
	if FileAccess.file_exists(path):
		var file = FileAccess.open(path, FileAccess.READ)
		if file:
			result = JSON.parse_string(file.get_as_text())
		else:
			push_error(FileAccess.get_open_error())
	return result
