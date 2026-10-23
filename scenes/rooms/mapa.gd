extends Node2D
@onready var C: Node2D = %C
@onready var M: Node2D = %M
@onready var Y: Node2D = %Y
@onready var K: Node2D = %K
@onready var porta: StaticBody2D = %Porta

var gray = ShaderMaterial.new()

func _ready():
	gray.shader = preload("res://assets/shaders/gray.gdshader")
	C.material = gray
	M.material = gray
	Y.material = gray
	
	porta.get_node("CollisionShape2D").set_deferred("disabled", false)
	porta.get_node("AnimatedSprite2D").play("closed")

func colorir(cor):
	var node = get_node("%" + cor)
	node.material = null
	var inimigos  = node.get_node("Enemies")
	inimigos.queue_free()
	print(cor + " foi colorido")
	
	if GameManager.EstadoCor >= 3:
		porta.get_node("CollisionShape2D").set_deferred("disabled", true)
		porta.get_node("AnimatedSprite2D").play("open")
