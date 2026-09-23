extends Control
var csv: Array = []
var jogadores: Array = []
var inimigos: Array = []
var turno_atual = 0
var batalha_ativa = false

@onready var acoes: TabContainer = %Acoes
@onready var selected: Label = %Selected

@onready var player_1: Label = %Player1
@onready var player_2: Label = %Player2
@onready var player_3: Label = %Player3
@onready var inimigo: Label = $inimigo
@onready var inimigodesc: RichTextLabel = %inimigodesc

@onready var atk: Label = %Atk
@onready var atk_1: Button = %atk1
@onready var atk_2: Button = %atk2



func _ready() -> void:
	var file = FileAccess.open(
		"res://data/combat/TCC CDE - Combat.csv",
		FileAccess.READ
	)

	while not file.eof_reached():
		csv.append(file.get_csv_line())





func combat(inimigo_id) -> void:
	jogadores.clear()
	inimigos.clear()

	jogadores.append(ler_csv(1))
	jogadores.append(ler_csv(2))
	jogadores.append(ler_csv(3))

	inimigos.append(ler_csv(inimigo_id))

	turno_atual = 0
	batalha_ativa = true

	acoes.current_tab = 0
	atualizar_ui()


func atacar(ataque_id: int) -> void:
	if not batalha_ativa:
		return

	var jogador = jogadores[turno_atual]
	var ataque = jogador["ataques"][ataque_id]
	var alvo = inimigos[0]

	alvo["hp"] -= ataque["dano"]
	alvo["hp"] = max(alvo["hp"], 0)

	print(
		jogador["nome"],
		" usou ",
		ataque["nome"],
		" em ",
		alvo["nome"],
		" causando ",
		ataque["dano"],
		" de dano"
	)

	if alvo["hp"] <= 0:
		fim(1)
		return

	proximo_turno()


func inimigo_atacar() -> void:
	if not batalha_ativa:
		return

	var inimig = inimigos[0]
	var vivos = jogadores_vivos()
	if vivos.is_empty():
		fim(0)
		return

	var ataque = inimig["ataques"].pick_random()
	var alvo = vivos.pick_random()

	alvo["hp"] -= ataque["dano"]
	if alvo["hp"] <= 0:
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

	if jogadores_vivos().is_empty():
		fim(0)
		return

	turno_atual = primeiro_jogador_vivo()

	atualizar_ui()


func proximo_turno() -> void:
	if not batalha_ativa:
		return
	acoes.current_tab = 0
	
	var proximo = proximo_jogador_vivo()

	if proximo == -1:
		fim(0)
		return

	turno_atual = proximo

	if turno_atual == primeiro_jogador_vivo():
		inimigo_atacar()
		return

	atualizar_ui()


func proximo_jogador_vivo() -> int:
	for i in range(1, jogadores.size() + 1):
		var indice = (turno_atual + i) % jogadores.size()

		if jogadores[indice]["hp"] > 0:
			return indice

	return -1


func primeiro_jogador_vivo() -> int:
	for i in range(jogadores.size()):
		if jogadores[i]["hp"] > 0:
			return i

	return -1


func jogadores_vivos() -> Array:
	var vivos: Array = []

	for jogador in jogadores:
		if jogador["hp"] > 0:
			vivos.append(jogador)

	return vivos

func fim(status: int) -> void:
	batalha_ativa = false

	if status == 1:
		print("VENCEU")
	elif status == 0:
		print("PERDEU")
	acoes.current_tab = 2
	atualizar_ui()
	get_tree().paused = false
	hide()


func ler_csv(id) -> Dictionary:
	var linha = csv[id]

	if linha[0].strip_edges() == "":
		linha = csv[4]

	return {
		"nome": linha[0].strip_edges(),
		"cor": linha[1].strip_edges(),
		"hp": int(linha[2]),
		"max_hp": int(linha[2]),
		"ataques": [
			{"nome": linha[4].strip_edges(), "dano": int(linha[3])},
			{"nome": linha[6].strip_edges(), "dano": int(linha[5])
			}
		]
	}


func atualizar_ui() -> void:
	player_1.text = texto_hp(jogadores[0])
	player_2.text = texto_hp(jogadores[1])
	player_3.text = texto_hp(jogadores[2])

	inimigo.text = texto_hp(inimigos[0])

	var jogador = jogadores[turno_atual]

	selected.text = jogador["nome"]
	atk.text = jogador["nome"] + " / atk"

	atk_1.text = texto_dano(jogador, 0)
	atk_2.text = texto_dano(jogador, 1)

	inimigodesc.text = (
		texto_hp(inimigos[0]) + "\n" +
		inimigos[0]["ataques"][0]["nome"] + " - " +
		str(inimigos[0]["ataques"][0]["dano"]) + " dano\n" +
		inimigos[0]["ataques"][1]["nome"] + " - " +
		str(inimigos[0]["ataques"][1]["dano"]) + " dano\n"
	)


func texto_hp(personagem: Dictionary) -> String:
	return (
		personagem["nome"] + " " +
		str(personagem["hp"]) + "/" + str(personagem["max_hp"])
	)


func texto_dano(personagem: Dictionary, num_atk: int) -> String:
	return (
		personagem["ataques"][num_atk]["nome"] + " - " +
		str(personagem["ataques"][num_atk]["dano"]) + " dano"
	)


func _on_sair_pressed() -> void:
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


func _on_atk_2_pressed() -> void:
	atacar(1)
