extends Node2D
@onready var C: Node2D = %C
@onready var M: Node2D = %M
@onready var Y: Node2D = %Y
@onready var K: Node2D = %K
var gray = ShaderMaterial.new()

func _ready():
	gray.shader = preload("res://assets/shaders/gray.gdshader")
	C.material = gray
	M.material = gray
	Y.material = gray
	pass
func colorir(cor):
	var node = get_node("%" + cor)
	node.material = null
	var inimigos  = node.get_node("Enemies")
	inimigos.queue_free()
	print(cor + " foi colorido")
	pass
