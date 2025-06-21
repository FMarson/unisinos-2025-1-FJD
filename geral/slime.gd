@tool
class_name Slime

extends CharacterBody2D

@export var speed: float = 100
var direction: int = 1 # 1 para direita, -1 para esquerda


func _ready() -> void:
	if has_node("VisibilityNotifier2D"):
		$VisibilityNotifier2D.screen_exited.connect(_on_screen_exited)
	else:
		push_warning("VisibilityNotifier2D node is missing!")

	if has_node("CollisionDetector"):
		$CollisionDetector.body_entered.connect(_on_body_entered)
	else:
		push_warning("CollisionDetector (Area2D) node is missing!")

func _physics_process(delta: float) -> void:
	velocity.x = speed * direction
	velocity.y = 0
	move_and_slide()

func _on_screen_exited() -> void:
	queue_free()

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		queue_free()
