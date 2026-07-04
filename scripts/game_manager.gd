extends Node
#SOCOFOROOROOIIJGFJALSGFLEWFUWEORHUGWFEHRKQWJHELPPPHELEPPAYUDAAAA
func _ready():
	pass

func combatstart():
	print("ESCUTEI")
	var combat = load("res://scenes/menus/combat.tscn").instantiate()
	get_tree().root.add_child(combat)
	# make it UImanagers problem
	pass
	
func levelchange(room):
	print("Helllooooooo")
	#hi future me you should make this thing talk to level manager and make it replace the their vhildren (kill them KILL THEM KILL THEM KILL THEM KILL
	pass 
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
