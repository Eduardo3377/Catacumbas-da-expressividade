extends CanvasLayer
@onready var main_menu: Control = %mainMenu
@onready var combat: Control = %combat
@onready var configuracoes: Control = %Configuracoes
@onready var creditos: Control = %Creditos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		child.hide()
	main_menu.show()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func currentMenu(menu):
	print("Usnado o menu: ", menu)
	var current = get(menu)
	current.show()
	
func combatstart(_enemy):
	print("comecando combate")
	combat.show()
	
func opcoes():
	print("entra nas opcao")
	configuracoes.show()
	pass
	
