extends Area2D
@export var cor = "K"
func _ready():
	show()
	$AnimatedSprite2D.play(cor)
	pass
	
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		hide()	
		GameManager.colorir(cor)
		set_deferred("monitoring", false)	
