extends Control
@onready var page_1: TabContainer = %page1
@onready var page_2: TabContainer = %page2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	page_2.current_tab = 0
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		show()

func _on_jogar_pressed() -> void:
	hide()
	$"MarginContainer/HBoxContainer/1/page1/VBoxContainer/VBoxContainer/Jogar".text = "Continuar"
	pass # Replace with function body.


func _on_opcoes_pressed() -> void:
	page_2.current_tab = 1
	pass # Replace with function body.


func _on_creditos_pressed() -> void:
	page_2.current_tab = 2
	pass # Replace with function body.


func _on_sair_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
