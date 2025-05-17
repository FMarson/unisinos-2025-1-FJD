extends Node2D


func _on_bt_game_over_pressed() -> void:
	get_tree().change_scene_to_file("res://game_over.tscn")
