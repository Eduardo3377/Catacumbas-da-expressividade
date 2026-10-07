extends Node
var PlayerPosition = []
var PlayerMoving: bool
var PararAndar = false
@onready var ui = get_tree().root.get_node("MainGame/Canvas/UI")
signal bgchange 
func _ready():
	pass

	
func PlayerPos(position):
	PlayerPosition.insert(0, position)
	if PlayerPosition.size() > 1000:
		PlayerPosition.pop_back()
	
func IsMoving(state):
	PlayerMoving = state
	
func Dialogo(Id):
	ui.dialogoo(Id)
	pass
	
func bgchanged(textura):
	bgchange.emit(textura)
	pass	

func pararandar(estado):
	PararAndar = estado

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
