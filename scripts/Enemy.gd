extends Area2D
func _ready():
	pass
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		print("tocou no inigmigo")
		get_node("/root/MainGame/UI").combatstart(self)
		set_deferred("monitoring", false)
