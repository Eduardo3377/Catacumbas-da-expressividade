extends Control
var csv: Array = []
var jogadores: Array = []
var inimigos: Array = []
var turno_atual = 0

@onready var acoes: TabContainer = %Acoes

@onready var player_1: Label = %Player1
@onready var player_2: Label = %Player2
@onready var player_3: Label = %Player3
@onready var inimigo: Label = $inimigo
@onready var inimigodesc: RichTextLabel = %inimigodesc

@onready var atk: Label = %Atk
@onready var atk_1: Button = %atk1
@onready var atk_2: Button = %atk2


@onready var cor: Label = %Cor
@onready var cor_1: Button = %cor1
@onready var cor_2: Button = %cor2
@onready var cor_3: Button = %cor3

@onready var selected: Label = %Selected

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
	
func _ready() -> void:
	var file = FileAccess.open("res://data/combat/TCC CDE - Combat.csv", FileAccess.READ)
	while not file.eof_reached():
		var linha = file.get_csv_line()
		csv.append(linha)

func combat(inimigoId) -> void:
	jogadores.clear()
	inimigos.clear()

	turno_atual = 0
	acoes.current_tab = 0
	
	carregar_jogadores()
	carregar_inimigo(inimigoId)

	atualizar_interface()

	print(jogadores)
	print(inimigos)

func carregar_jogadores() -> void:
	jogadores.append(ler_csv(1))
	jogadores.append(ler_csv(2))
	jogadores.append(ler_csv(3))

func carregar_inimigo(id) -> void:
	inimigos.append(ler_csv(id))

func atualizar_interface() -> void:
	player_1.text = texto_hp(jogadores[0])
	player_2.text = texto_hp(jogadores[1])
	player_3.text = texto_hp(jogadores[2])
	inimigo.text = texto_hp(inimigos[0])
	var jogador = jogadores[turno_atual]
	selected.text = jogador["nome"]
	atk.text = jogador["nome"] + " / atk"

	atk_1.text = jogador["ataques"][0]["nome"] + " - " + str(jogador["ataques"][0]["dano"]) + " dano"
	atk_2.text = jogador["ataques"][1]["nome"] + " - " + str(jogador["ataques"][1]["dano"]) + " dano"
	
	inimigodesc.text = (
		texto_hp(inimigos[0]) + "\n" +
		inimigos[0]["ataques"][0]["nome"] + " - " + str(inimigos[0]["ataques"][0]["dano"]) + " dano\n" +
		inimigos[0]["ataques"][1]["nome"] + " - " + str(inimigos[0]["ataques"][1]["dano"]) + " dano\n" 
	)
	
func texto_hp(personagem: Dictionary) -> String:
	return personagem["nome"] + " " + str(personagem["hp"]) + "/" + str(personagem["max_hp"])

func atacar(ataque_id) -> void:
	var jogador = jogadores[turno_atual]
	var ataque = jogador["ataques"][ataque_id]
	var alvo = inimigos[0]

	alvo["hp"] -= ataque["dano"]

	if alvo["hp"] < 0:
		alvo["hp"] = 0
		fim(1)

	atualizar_interface()
	
	
func fim(status):
	if status == 1:
		print("VENCEU")
	elif status == 0:
		print("PERDEU")
	get_tree().paused = false
	hide()
	
func proximo_turno() -> void:
	turno_atual += 1
	acoes.current_tab = 0
	if turno_atual >= jogadores.size():
		turno_atual = 0


func _on_sair_pressed() -> void:
	print("saiu")
	get_tree().paused = false
	hide()

func _on_atk_pressed() -> void:
	acoes.current_tab = 1
	pass # Replace with function body.


func _on_cor_pressed() -> void:
	acoes.current_tab = 2
	pass # Replace with function body.
	

func _on_checar_pressed() -> void:
	acoes.current_tab = 3
	pass # Replace with function body.

func _on_atk_1_pressed() -> void:
	atacar(0)
	proximo_turno()

func _on_atk_2_pressed() -> void:
	atacar(1)
	proximo_turno()


func _on_voltar_pressed() -> void:
	acoes.current_tab = 0

func _on_voltar_2_pressed() -> void:
	acoes.current_tab = 0
	pass # Replace with function body.
