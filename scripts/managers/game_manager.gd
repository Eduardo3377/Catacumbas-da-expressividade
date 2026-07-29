extends Node
signal addUi
signal dropUi
signal level_change
func _ready():
	pass

func combatstart():
	print("ESCUTEI")
	addUi.emit()
	# fazer o UIManager fazer isso
	pass
	
func levelchange(room):
	print("Helllooooooo")
	level_change.emit(room)
	# falar com o level manager OU não usar teleporters no jogo 
	pass 
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass



#SOCOFOROOROOIIJGFJALSGFLEWFUWEORHUGWFEHRKQWJHELPPPHELEPPAYUDAAAA
