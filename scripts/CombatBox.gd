extends Area2D
signal combatstart
# var simultaneous_scene = preload("res://scenes/combat.tscn")
func _ready():
	pass
func _on_body_entered(_body: Node2D) -> void:
	print("tocou no inigmigo")
	GameManager.combatstart()
# 	get_tree().call_deferred("change_scene_to_packed", simultaneous_scene)
