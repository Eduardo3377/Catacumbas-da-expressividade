extends CharacterBody2D
class_name Player
@export_range(50.0, 500.0) var SPEED = 100.0
@onready var sprite_2d = $Sprite2D
func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction:
		GameManager.PlayerPos(global_position)
		velocity = direction * SPEED
		if direction.x < 0:
			sprite_2d.flip_h = false  
		elif direction.x > 0:
			sprite_2d.flip_h = true 
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)
	move_and_slide()
