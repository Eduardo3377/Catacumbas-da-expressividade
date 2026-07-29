extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.addUi.connect(add_ui)
	GameManager.dropUi.connect(drop_ui)
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func add_ui():
	var combat = load("res://scenes/menus/combat.tscn").instantiate()
	add_child(combat)
	pass

func drop_ui():
	pass
