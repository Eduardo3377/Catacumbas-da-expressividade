extends Control
@onready var nome: Label = %Nome
@onready var texto: RichTextLabel = %Texto
var idAtual
var linhas: Array = []

func _ready() -> void:
	var file = FileAccess.open("res://data/roteiro/TCC CDE - Roteiro.csv", FileAccess.READ)
	while not file.eof_reached():
		var linha = file.get_csv_line()
		linhas.append(linha)

func dialogo(id):
	show()
	idAtual = id
	print(id)
	if idAtual < linhas.size():
		var linha = linhas[id]
		if linha[0].strip_edges() == "":
			hide()
		else: 
			nome.text = linha[0] + ":"
			texto.text = linha[1]
			print(linha)
	else: 
		hide()

		
func _input(event):
	if event.is_action_pressed("ui_accept"):
		dialogo(idAtual + 1)
