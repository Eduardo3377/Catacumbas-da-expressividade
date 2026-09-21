extends Control
@onready var combat: Control = %combat
@onready var menu: Control = %menu
@onready var dialogo: Control = %Dialogo

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show()
	for child in get_children():
		child.hide()
	menu.show()
	#dialogo.show()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

#func currentMenu(menu):
#	print("Usnado o menu: ", menu)
#	var current = get(menu)
#	current.show()
	
func combatstart(_enemy):
	print("comecando combate")
	combat.show()

func dialogoo(id):
	dialogo.dialogo(id)
	pass
