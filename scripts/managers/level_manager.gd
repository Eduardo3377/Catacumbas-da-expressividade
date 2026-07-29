extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.level_change.connect(level_change)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
func level_change(room):
	get_child(0).queue_free()
	add_child(room)
	pass
