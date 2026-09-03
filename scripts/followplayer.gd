extends Node2D
@export_range(0, 500) var PosIndex = 100
var ArraySize = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func PP(PlayerPosition):
	print(PlayerPosition)
	# ESSA COISA NAO ESCUTA O SINAL
	
	
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	ArraySize = len(GameManager.PlayerPosition) -1
	if !GameManager.PlayerPosition.is_empty():
		if ArraySize < PosIndex:
			global_position = GameManager.PlayerPosition[ArraySize]
			print(GameManager.PlayerPosition[ArraySize])
		else:
			global_position = GameManager.PlayerPosition[PosIndex]
			print(GameManager.PlayerPosition[PosIndex])
	print("OI EU (", self,") ESTOU EM ", position)
	pass
