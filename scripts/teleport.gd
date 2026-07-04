extends Area2D
@export var room = preload("res://scenes/rooms/room2.tscn")
signal levelchange

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_body_entered(_body: Node2D) -> void:
	print("tocou no tp")
	GameManager.levelchange(room)
	pass
