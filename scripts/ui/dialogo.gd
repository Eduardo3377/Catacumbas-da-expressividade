extends Control
@onready var nome: Label = %Nome
@onready var texto: RichTextLabel = %Texto
var idAtual
var csv: Array = []

func _ready() -> void:
	var file = FileAccess.open("res://data/roteiro/TCC CDE - Roteiro.csv", FileAccess.READ)
	while not file.eof_reached():
		var linha = file.get_csv_line()
		csv.append(linha)

func dialogo(id):
	show()
	idAtual = id
	print(id)
	if idAtual < csv.size():
		var linha = csv[id]
		if linha[0].strip_edges() == "":
			hide()
		else: 
			nome.text = linha[0].strip_edges() + ":"
			texto.text = linha[1].strip_edges()
			print(linha)
	else: 
		hide()

		
func _input(event):
	if event.is_action_pressed("ui_accept"):
		dialogo(idAtual + 1)
