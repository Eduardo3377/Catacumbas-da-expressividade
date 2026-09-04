extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(_delta):
	for node2d in get_children():
		node2d.z_index = 1000 + node2d.global_position.y
