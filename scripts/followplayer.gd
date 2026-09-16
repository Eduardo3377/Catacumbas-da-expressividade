extends Node2D
@export_range(0, 500) var PosIndex = 100
var ArraySize = 0
var Next_pos: Vector2

func _ready() -> void:
	pass # Replace with function body.

func _physics_process(_delta: float) -> void:
	ArraySize = len(GameManager.PlayerPosition) -1
	if !GameManager.PlayerPosition.is_empty():
		if ArraySize < PosIndex:
			global_position = GameManager.PlayerPosition[ArraySize -1]
			Next_pos = GameManager.PlayerPosition[ArraySize]
			
		else:
			global_position = GameManager.PlayerPosition[PosIndex -1]
			Next_pos = GameManager.PlayerPosition[PosIndex]
			
	if Next_pos.y < global_position.y:
		$AnimatedSprite2D.play("frente")
	elif Next_pos.y > global_position.y:
		$AnimatedSprite2D.play("tras")
	elif Next_pos.x < global_position.x:
		$AnimatedSprite2D.play("lado")
		$AnimatedSprite2D.flip_h = false 
	elif Next_pos.x > global_position.x:
		$AnimatedSprite2D.play("lado")
		$AnimatedSprite2D.flip_h = true
		
	if GameManager.PlayerMoving == false:
		$AnimatedSprite2D.frame = 0
		$AnimatedSprite2D.pause()
	else:
		$AnimatedSprite2D.play()
