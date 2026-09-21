extends Control
@onready var nome: Label = %Nome
@onready var texto: RichTextLabel = %Texto


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func dialogo(_id):
	nome.text = "Edu" + ":" 
	texto.text = "AAAAAAAAAAAAAAAAA"
	pass
