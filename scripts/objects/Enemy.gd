extends Area2D
var csv: Array = []
@export var InimigoId: Array[int] = [4, 0, 0]
@onready var sprite: AnimatedSprite2D = %Sprite

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		print("tocou no inigmigo")
		get_node("/root/MainGame/Canvas/UI").combatstart(InimigoId)
		set_deferred("monitoring", false)
		hide()

func _ready() -> void:
	var file = FileAccess.open("res://data/combat/TCC CDE - Combat.csv", FileAccess.READ)

	while not file.eof_reached():
		csv.append(file.get_csv_line())
	
	var inimigo = ler_csv(InimigoId[0])
	sprite.play(str(inimigo["nome"]))

func ler_csv(id) -> Dictionary:
	var coluna = csv[id]
	if id == 0 || coluna[0].strip_edges() == "":
		return {}
		
	else: return {
		"nome": coluna[0].strip_edges()
	}
