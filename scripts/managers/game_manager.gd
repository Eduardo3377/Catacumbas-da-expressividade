extends Node
# signal level_change
var PlayerPosition = []
var PlayerMoving: bool
@onready var ui = get_tree().root.get_node("MainGame/Canvas/UI")
func _ready():
	pass
	
# func levelchange(room):
#	print("Helllooooooo")
#	level_change.emit(room)
#	# falar com o level manager OU não usar teleporters no jogo 
#  # que teleporters se fodam
#	pass 
	
func combatstart():
	ui.on_combatstart()
	
	
func PlayerPos(position):
	PlayerPosition.insert(0, position)
	if PlayerPosition.size() > 1000:
		PlayerPosition.pop_back()
	
func IsMoving(state):
	PlayerMoving = state
	
func Dialogo(Id):
	ui.dialogoo(Id)
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
