extends Node
#SOCOFOROOROOIIJGFJALSGFLEWFUWEORHUGWFEHRKQWJHELPPPHELEPPAYUDAAAA
signal addUi
signal dropUi
signal level_change
func _ready():
	pass

func combatstart():
	print("ESCUTEI")
	addUi.emit()
	# make it UImanagers problem
	pass
	
func levelchange(room):
	print("Helllooooooo")
	level_change.emit(room)
	#hi future me you should make this thing talk to level manager and make it replace the their vhildren
	pass 
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
