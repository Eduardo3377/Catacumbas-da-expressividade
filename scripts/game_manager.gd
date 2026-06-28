extends Node
#SOCOFOROOROOIIJGFJALSGFLEWFUWEORHUGWFEHRKQWJ

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func combatstart():
	print("ESCUTEI")
	var combat = load("res://scenes/menus/combat.tscn").instantiate()
	get_tree().root.add_child(combat)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
