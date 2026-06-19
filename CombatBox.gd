extends Area2D
signal combat
# var simultaneous_scene = preload("res://scenes/combat.tscn")
func _ready():
	print("inimigo spawandaedo")

func _on_body_entered(_body: Node2D) -> void:
	print("tocou no inigmigo")
	combat.emit()
# 	get_tree().call_deferred("change_scene_to_packed", simultaneous_scene)
