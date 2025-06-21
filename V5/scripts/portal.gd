extends Area2D

@onready var animacao = $vfx as AnimatedSprite2D
@onready var som = $sfx as AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func _on_body_entered(body):
	print(body.name)
	print("Entrou o personagem.")
	som.play()
	body.position.x += 100;
