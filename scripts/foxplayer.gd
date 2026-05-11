extends CharacterBody2D


const SPEED = 100.0
func _process(_float):
	rotate(TAU)
func _physics_process(_delta: float) -> void:
	
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction:
		velocity = direction * SPEED
	else:

		velocity = velocity.move_toward(Vector2.ZERO, SPEED)


	move_and_slide()
