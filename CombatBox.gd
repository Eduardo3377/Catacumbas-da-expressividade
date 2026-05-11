extends Area2D
var simultaneous_scene = preload("res://scenes/combat.tscn")
func _ready():
	print("combatbithc")

func _on_body_entered(_body: Node2D) -> void:
	print("combat sceneidfjk")
	get_tree().call_deferred("change_scene_to_packed", simultaneous_scene)
