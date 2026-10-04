extends Node2D
@export_range(0, 1000) var Index = 100
@export var Background = false
var ArraySize = 0
var Next_pos: Vector2

func _ready() -> void:
	GameManager.bgchange.connect(bgchange)
	
func _physics_process(_delta: float) -> void:
	ArraySize = len(GameManager.PlayerPosition) -1
	if !GameManager.PlayerPosition.is_empty():
		if ArraySize < Index:
			global_position = GameManager.PlayerPosition[ArraySize -1]
			Next_pos = GameManager.PlayerPosition[ArraySize]
			
		else:
			global_position = GameManager.PlayerPosition[Index -1]
			Next_pos = GameManager.PlayerPosition[Index]
				
	if !Background:
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
		
		


func bgchange(bg):
	if Background:
		$AnimatedSprite2D.play(bg)
		match bg:
			"2":
				$AnimatedSprite2D.modulate = Color("fff0d7")
			"3":
				$AnimatedSprite2D.modulate = Color("b7daea")
			"4":
				$AnimatedSprite2D.modulate = Color("ff9fa7")
			_:
				$AnimatedSprite2D.modulate = Color("ffffff")
