extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func combat() -> void:
	var file = FileAccess.open("res://data/combat/TCC CDE - Combat.csv", FileAccess.READ)
	var data := {}
	file.get_csv_line()
	
	while not file.eof_reached():
		var linha = file.get_csv_line()
	
	
func _on_sair_pressed() -> void:
	print("saiu")
	get_tree().paused = false
	hide()
