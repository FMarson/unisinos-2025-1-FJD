extends Area2D

@onready var som = $sfx as AudioStreamPlayer

var jogador_dentro_area: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print("Entrou o personagem.")
	jogador_dentro_area = true
	#queue_free()


func _on_body_exited(body):
	print("Saiu o personagem.")
	jogador_dentro_area = false
