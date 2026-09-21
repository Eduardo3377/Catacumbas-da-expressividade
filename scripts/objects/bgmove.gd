extends Sprite2D
@export_range(-1.0, 1.0) var MoveX: float = 0.0
@export_range(-1.0, 1.0) var MoveY: float = 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	region_rect.position += Vector2(MoveX, MoveY) * delta
	pass
