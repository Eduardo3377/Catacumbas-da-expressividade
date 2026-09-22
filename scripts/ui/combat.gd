extends Control
var idAtual
var csv: Array = []

func _ready() -> void:
	var file = FileAccess.open("res://data/combat/TCC CDE - Combat.csv", FileAccess.READ)
	while not file.eof_reached():
		var linha = file.get_csv_line()
		csv.append(linha)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

#le o csv 
#pega o id do(s) inimigo(s)
#coloca os integrantes da batalha em dois Arrays, player/inimigos
#func rodada:
#while inimigos !== morto: 
#	turno players 
#	turno inimigos


func combat(id) -> void:
	idAtual = id
	print(id)
	if idAtual < csv.size():
		var linha = csv[id]
		if linha[0].strip_edges() == "":
			hide()
		else: 
#			nome.text = linha[0].strip_edges() + ":"
#			texto.text = linha[1].strip_edges()
			print(linha)
	else: 
		hide()
	pass
	
func _on_sair_pressed() -> void:
	print("saiu")
	get_tree().paused = false
	hide()
