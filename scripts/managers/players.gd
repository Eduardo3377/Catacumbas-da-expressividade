extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(_delta):
	for player in get_children():
		player.z_index = 1000 + player.global_position.y
