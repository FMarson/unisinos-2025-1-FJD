extends Node2D

func _on_bt_menu_inicial_pressed() -> void:
	get_tree().change_scene_to_file("res://menu_inicial.tscn")
