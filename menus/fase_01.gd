extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_bt_fase_02_pressed() -> void:
	get_tree().change_scene_to_file("res://fase_02.tscn")
