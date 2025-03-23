extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.modulate = Color(1, 1, 1, 0.8)  # 最后一个参数是透明度，0.5 表示半透明
	self.z_index = -1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text="w,s控制左板,小键盘上下控制右板"
	pass
