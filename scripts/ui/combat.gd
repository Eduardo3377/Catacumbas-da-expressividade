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
@onready var inimigo: Label = %inimigo1
@onready var inimigodesc: RichTextLabel = %inimigodesc
@export var historico: Label

@onready var atk: Label = %Atk
@onready var atk_1: Button = %atk1
@onready var atk_2: Button = %atk2

@onready var gameover: Control = %gameover

# abrir e ler o csv 
func _ready() -> void:
	var file = FileAccess.open(
		"res://data/combat/TCC CDE - Combat.csv",
		FileAccess.READ
	)

	while not file.eof_reached():
		csv.append(file.get_csv_line())

func ler_csv(id) -> Dictionary:
	var coluna = csv[id]
	if id == 0 || coluna[0].strip_edges() == "":
		return {}
		
	else: return {
		"nome": coluna[0].strip_edges(),
		"cor": coluna[1].strip_edges(),
		"hp": int(coluna[2]),
		"max_hp": int(coluna[2]),
		"ataques": [
			{"nome": coluna[4].strip_edges(), "dano": int(coluna[3])},
			{"nome": coluna[6].strip_edges(), "dano": int(coluna[5])
			}
		]
	}

# setup do combate e variaveis
func combat(inimigo_id) -> void:
	jogadores.clear()
	inimigos.clear()
	historico.text = "histórico"
	
	# time do player
	jogadores.append(ler_csv(1))
	jogadores.append(ler_csv(4))
	jogadores.append(ler_csv(3))
	# time inimigo
	print(inimigo_id)
	for id in inimigo_id.slice(0, 3):
		if id == 0 || id == null:
			continue
		else: inimigos.append(ler_csv(id))

	batalha_ativa = true
	turno_atual = 0
	acoes.current_tab = 0
	atualizar_ui()
	
# antigo ataque de player, ainda em uso
func player_atacar(ataque_id: int) -> void:
	if not batalha_ativa:
		return

	var jogador = jogadores[turno_atual]
	var ataque = jogador["ataques"][ataque_id]
	var alvo = inimigos[0]

	alvo["hp"] -= ataque["dano"]
	alvo["hp"] = max(alvo["hp"], 0)

	historico.text = ( jogador["nome"] + " usou " + ataque["nome"] + " em " + alvo["nome"] + " causando " + str(ataque["dano"]) + " de dano")

	if alvo["hp"] <= 0:
		fim(1)
		return

	proximo_turno()

# antigo ataque de inimigo, ainda em uso
func inimigo_atacar() -> void:
	if not batalha_ativa:
		return

	var inimig = inimigos[0]
	var vivos = personagems_vivos(jogadores)
	if vivos.is_empty():
		fim(0)
		return

	var ataque = inimig["ataques"].pick_random()
	var alvo = vivos.pick_random()

	alvo["hp"] -= ataque["dano"]
	if alvo["hp"] <= 0:
		alvo["hp"] = 0

	historico.text = ( inimig["nome"] + " usou " + ataque["nome"] + " em " + alvo["nome"] + " causando " + str(ataque["dano"]) + " de dano")

	if personagems_vivos(jogadores).is_empty():
		fim(0)
		return

	turno_atual = primeiro_vivo(jogadores)

	atualizar_ui()
	
# o que atacar deveria ser, só falta implementar mesmo kakak
func atacar(atacante: Dictionary, ataque_id: int, alvo: Dictionary) -> void:
	var ataque = atacante["ataques"][ataque_id]

	alvo["hp"] = max(alvo["hp"] - ataque["dano"], 0)

	historico.text = (
		atacante["nome"] + " usou " +
		ataque["nome"] + " em " +
		alvo["nome"] + " causando " +
		str(ataque["dano"]) + " de dano"
	)
	if personagems_vivos(jogadores).is_empty():
		fim(0)
	if personagems_vivos(inimigos).is_empty():
		fim(1)

	turno_atual = primeiro_vivo(jogadores)
	atualizar_ui()

func proximo_turno() -> void:
	if not batalha_ativa:
		return
	acoes.current_tab = 0
	
	var proximo = proximo_vivo(jogadores)

	if proximo == -1:
		fim(0)
		return

	turno_atual = proximo

	if turno_atual == primeiro_vivo(jogadores):
		inimigo_atacar()
		return

	atualizar_ui()


func proximo_vivo(time) -> int:
	for i in range(1, time.size() + 1):
		var indice = (turno_atual + i) % time.size()

		if time[indice]["hp"] > 0:
			return indice

	return -1


func primeiro_vivo(time) -> int:
	for i in range(time.size()):
		if time[i]["hp"] > 0:
			return i

	return -1


func personagems_vivos(time) -> Array:
	var vivos: Array = []

	for personagem in time:
		if personagem["hp"] > 0:
			vivos.append(personagem)

	return vivos
	
func fim(status: int) -> void:
	batalha_ativa = false
	acoes.current_tab = 2
	atualizar_ui()
	GameManager.PararAndar = false
	if status == 1:
		print("VENCEU")
		hide()
	elif status == 0:
		print("PERDEU")
		gameover.show()



# ui
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


# botoes
func _on_sair_pressed() -> void:
	GameManager.PararAndar = false
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
	player_atacar(0)

func _on_atk_2_pressed() -> void:
	player_atacar(1)
