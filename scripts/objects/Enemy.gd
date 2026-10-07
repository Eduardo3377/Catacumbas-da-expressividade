extends Area2D
@export var InimigoId: Array[int] = [4, 0, 0]
func _ready():
	pass
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		print("tocou no inigmigo")
		get_node("/root/MainGame/Canvas/UI").combatstart(InimigoId)
		set_deferred("monitoring", false)
		hide()
