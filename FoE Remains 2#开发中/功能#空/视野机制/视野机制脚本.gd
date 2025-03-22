extends Node
var zxksjl=10
var hjys=1
var gzys=1
var ksjl=0

func sy():
	ksjl=zxksjl+1000*hjys*gzys
	
	pass
	
func _ready() -> void:
	
	sy()
	
	
	print(ksjl)
	pass
