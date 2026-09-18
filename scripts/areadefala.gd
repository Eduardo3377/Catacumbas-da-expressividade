extends Area2D
@export_range(1, 200) var FalaId = 1


func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		print("FALA ALGO")
		GameManager.Dialogo(FalaId)
		set_deferred("monitoring", false)
	pass
