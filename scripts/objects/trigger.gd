extends Area2D
@export var Repete = false
@export var Fala = false
@export_range(1, 200) var FalaId = 1
@export var Fundo = false
@export var TexturaFundo = "default"
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		if Fala:
			print("FALA ALGO")
			GameManager.Dialogo(FalaId)
		elif Fundo:
			GameManager.bgchanged(TexturaFundo)
		if !Repete:
			set_deferred("monitoring", false)		
	pass
