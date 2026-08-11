extends Control
@onready var ui: CanvasLayer = %UI

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_jogar_pressed() -> void:
	print("jogar")
	hide()
	pass # Replace with function body.


func _on_opcoes_pressed() -> void:
	print("opcoes")
	ui.currentMenu("configuracoes")
	hide()
	pass # Replace with function body.


func _on_creditos_pressed() -> void:
	print("creditos")
	ui.currentMenu("creditos")
	pass # Replace with function body.


func _on_sair_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
