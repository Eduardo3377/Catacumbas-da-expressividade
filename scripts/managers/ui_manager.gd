extends CanvasLayer
@onready var main_menu: Control = %mainMenu
@onready var combat: Control = %combat

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("AAAAAAAAAAAAAAAAAAAAAAA")
	main_menu.hide()
	combat.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func combatstart(_self):
	print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAaa")
	combat.show()
