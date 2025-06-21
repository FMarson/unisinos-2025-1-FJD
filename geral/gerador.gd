extends Node2D
'''
@export var scene_to_instance: PackedScene
@export var spawn_position: Vector2 = Vector2(0.0, 0.0)
@export var initial_delay: float = 2.0
@export var interval: float = 1.0
@onready var SlimeScene := preload("res://Slime.tscn")



const MAX_INSTANCES = 4

var active_instances: Array = []
var timer: Timer

func _ready() -> void:
	timer = Timer.new()
	timer.wait_time = interval
	timer.one_shot = false
	timer.autostart = false
	add_child(timer)

	await get_tree().create_timer(initial_delay).timeout

	timer.start()

	timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout() -> void:
	active_instances = active_instances.filter(func(instance):
		return instance and instance.is_inside_tree()
	)

	if active_instances.size() < MAX_INSTANCES:
		var new_instance = scene_to_instance.instantiate()
"res://build/"		new_instance.position = spawn_position

		new_instance.direction = -1 if randf() < 0.5 else 1

		add_child(new_instance)
		active_instances.append(new_instance)
'''
