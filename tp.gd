extends Area2D
var simultaneous_scene = preload("res://scenes/test_room.tscn")
func _ready():
	print("teleprot")

func _on_body_entered(_body: Node2D) -> void:
	print("teleportacion")
	get_tree().call_deferred("change_scene_to_packed", simultaneous_scene)
