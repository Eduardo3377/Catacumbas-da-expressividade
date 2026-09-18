extends Node
# signal level_change
var PlayerPosition = []
var PlayerMoving: bool
func _ready():
	pass
	
# func levelchange(room):
#	print("Helllooooooo")
#	level_change.emit(room)
#	# falar com o level manager OU não usar teleporters no jogo 
#  # que teleporters se fodam
#	pass 
	
func combatstart():
	var ui = get_tree().root.get_node("MainGame/UI")
	ui.on_combatstart()
	
	
func PlayerPos(position):
	PlayerPosition.insert(0, position)
	if PlayerPosition.size() > 100000:
		PlayerPosition.pop_back()
	
func IsMoving(state):
	PlayerMoving = state
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
