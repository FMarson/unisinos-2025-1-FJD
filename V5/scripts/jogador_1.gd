extends CharacterBody2D

const SPEED = 150.0

@onready var animacao = $Animacao as AnimatedSprite2D
@onready var animacao_teleporte = $teleporte as AnimatedSprite2D
@onready var atacando = true
var pontuacao := 0

func _ready():
	#animacao_teleporte.hide()
	print("Comecei")

func _physics_process(_delta):
	var direction_x = Input.get_axis("player_1_esquerda", "player_1_direita") #-1 0 1 
	var direction_y = Input.get_axis("player_1_cima", "player_1_baixo") #-1 0 1
	
	if direction_x: # -1 ou 1
		if direction_x == -1: # esquerda
			animacao.play("andar_esquerda")
		else:
			animacao.play("andar_direita")#
		velocity.x = direction_x * SPEED # esquerda/direita
	else: # 0
		velocity.x = move_toward(velocity.x, 0, SPEED) #parado
		
		
	if direction_y: # -1 ou 1
		if direction_y == -1:
			animacao.play("andar_cima")
		else:
			animacao.play("andar_baixo")
		velocity.y = direction_y * SPEED # cima/baixo
	else: # 0
		velocity.y = move_toward(velocity.y, 0, SPEED) #parado
		
	if direction_x == 0 and direction_y == 0:
		animacao.play("idle")
	
	if Input.is_action_just_pressed("player_1_ataque"):
		atacando = true
	else: 
		atacando = false
	
	move_and_slide()
	
	

func _on_portal_1_body_entered(_body):
	print("Entrei no portal 1")
	animacao_teleporte.play()
	#position.y -= 100


func _on_portal_2_body_entered(_body):
	print("Entrei no portal 2")
	animacao_teleporte.play()
	#position.y += 100
	


func invencibilidade():
	print("Saí do portal e estou invencivel")

func _on_portal_1_body_exited(body):
	invencibilidade()


func _on_vaso_body_entered(body):
	#print(body.name)
	pass


func _on_vaso_area_entered(area):
	print(area.name)
	pass # Replace with function body.
