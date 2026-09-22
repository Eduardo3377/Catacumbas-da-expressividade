extends Control
var idAtual
var csv: Array = []
var jogadores: Array = []
var inimigos: Array = []
@onready var player_1: Label = %Player1
@onready var player_2: Label = %Player2
@onready var player_3: Label = %Player3

@onready var atk: Label = %Atk
@onready var atk_1: Button = %atk1
@onready var atk_2: Button = %atk2
@onready var atk_3: Button = %atk3

@onready var cor: Label = %Cor
@onready var cor_1: Button = %cor1
@onready var cor_2: Button = %cor2
@onready var cor_3: Button = %cor3


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

func combat(inimigoId) -> void:
	jogadores.clear()
	inimigos.clear()

	jogadores.append(ler_csv(1))
	jogadores.append(ler_csv(2))
	jogadores.append(ler_csv(3))

	inimigos.append(ler_csv(inimigoId))

	print(jogadores)
	print(inimigos)
	player_1.text = jogadores[0]["nome"] + " " + str(jogadores[0]["hp"]) + "/" + str(jogadores[0]["max_hp"])
	player_2.text = jogadores[1]["nome"] + " " + str(jogadores[1]["hp"]) + "/" + str(jogadores[1]["max_hp"])
	player_3.text = jogadores[2]["nome"] + " " + str(jogadores[2]["hp"]) + "/" + str(jogadores[2]["max_hp"])
	
	turno(jogadores, 0)
	turno(jogadores, 1)
	turno(jogadores, 2)
	turno(inimigos, inimigoId)
		
func ler_csv(id) -> Dictionary:
	var linha = csv[id]
	if linha[0].strip_edges() == "":
		linha = csv[4]
		
	var personagem = {
		"nome": linha[0].strip_edges(),
		"cor": linha[1].strip_edges(),
		"hp": int(linha[2]),
		"max_hp": int(linha[2]),
		"ataques": [
			{
				"nome": linha[4].strip_edges(),
				"dano": int(linha[3])
			},
			{
				"nome": linha[6].strip_edges(),
				"dano": int(linha[5])
			},
			{
				"nome": linha[8].strip_edges(),
				"dano": int(linha[7])
			}
		]
	}
	return personagem
	
func turno(time, id):
	if time == jogadores:
		atk.text = jogadores[id]["nome"] + " / atk"
		atk_1.text = jogadores[id]["ataques"][0]["nome"]
		atk_2.text = jogadores[id]["ataques"][1]["nome"]
		atk_3.text = jogadores[id]["ataques"][2]["nome"]
		
		cor.text = jogadores[id]["nome"] + " / cor"
		cor_1.text = jogadores[id]["cor"]
		cor_2.text = jogadores[id]["cor"]
		cor_3.text = jogadores[id]["cor"]
	pass
	
func _on_sair_pressed() -> void:
	print("saiu")
	get_tree().paused = false
	hide()
