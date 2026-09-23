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

@onready var selected: Label = %Selected

func _ready() -> void:
	var file = FileAccess.open("res://data/combat/TCC CDE - Combat.csv", FileAccess.READ)
	while not file.eof_reached():
		var linha = file.get_csv_line()
		csv.append(linha)
	
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
			{"nome": linha[4].strip_edges(), "dano": int(linha[3])},
			{"nome": linha[6].strip_edges(), "dano": int(linha[5])},
			{"nome": linha[8].strip_edges(), "dano": int(linha[7])}
		]
	}
	return personagem

func combat(inimigoId) -> void:
	jogadores.clear()
	inimigos.clear()
	
	jogadores.append(ler_csv(1))
	jogadores.append(ler_csv(2))
	jogadores.append(ler_csv(3))
	inimigos.append(ler_csv(inimigoId))
	
	turno_atual = 0
	acoes.current_tab = 0
	atualizar_interface()


func atacar(ataque_id) -> void:
	var jogador = jogadores[turno_atual]
	var ataque = jogador["ataques"][ataque_id]
	var alvo = inimigos[0]

	alvo["hp"] -= ataque["dano"]

	if alvo["hp"] <= 0:
		alvo["hp"] = 0
		fim(1)

	atualizar_interface()

func inimigo_atacar() -> void:
	var inimig = inimigos[0]
	var ataque = inimig["ataques"].pick_random()

	var jogadores_vivos = []

	for jogador in jogadores:
		if jogador["hp"] > 0:
			jogadores_vivos.append(jogador)
			
	if jogadores_vivos.is_empty():
		fim(0)
		return
	
	var alvo = jogadores_vivos.pick_random()
	
	alvo["hp"] -= ataque["dano"]
	
	if alvo["hp"] < 0:
		alvo["hp"] = 0
		
	print(
		inimig["nome"],
		" usou ",
		ataque["nome"],
		" em ",
		alvo["nome"],
		" causando ",
		ataque["dano"],
		" de dano"
	)
	atualizar_interface()
	
func proximo_turno() -> void:
	turno_atual += 1
	acoes.current_tab = 0
	if turno_atual >= jogadores.size():
		turno_atual = 0
		inimigo_atacar()
	atualizar_interface()
		
func fim(status):
	if status == 1:
		print("VENCEU")
	elif status == 0:
		print("PERDEU")
	get_tree().paused = false
	hide()

	
func atualizar_interface() -> void:
	player_1.text = texto_hp(jogadores[0])
	player_2.text = texto_hp(jogadores[1])
	player_3.text = texto_hp(jogadores[2])
	inimigo.text = texto_hp(inimigos[0])
	var jogador = jogadores[turno_atual]
	selected.text = jogador["nome"]
	atk.text = jogador["nome"] + " / atk"

	atk_1.text = texto_dano(jogador,0)
	atk_2.text = texto_dano(jogador,1)
	
	inimigodesc.text = (
		texto_hp(inimigos[0]) + "\n" +
		inimigos[0]["ataques"][0]["nome"] + " - " + str(inimigos[0]["ataques"][0]["dano"]) + " dano\n" +
		inimigos[0]["ataques"][1]["nome"] + " - " + str(inimigos[0]["ataques"][1]["dano"]) + " dano\n" 
	)
	
func texto_hp(personagem: Dictionary) -> String:
	return personagem["nome"] + " " + str(personagem["hp"]) + "/" + str(personagem["max_hp"])
	
func texto_dano(personagem: Dictionary, numAtk) -> String:
	return personagem["ataques"][0]["nome"] + " - " + str(personagem["ataques"][numAtk]["dano"]) + " dano"
	
	
	
func _on_sair_pressed() -> void:
	print("saiu")
	get_tree().paused = false
	hide()
	
func _on_atk_pressed() -> void:
	acoes.current_tab = 1
	
func _on_cor_pressed() -> void:
	acoes.current_tab = 2
	
func _on_checar_pressed() -> void:
	acoes.current_tab = 3
	
func _on_voltar_pressed() -> void:
	acoes.current_tab = 0
	
func _on_voltar_2_pressed() -> void:
	acoes.current_tab = 0
	
func _on_atk_1_pressed() -> void:
	atacar(0)
	proximo_turno()
	
func _on_atk_2_pressed() -> void:
	atacar(1)
	proximo_turno()
	
