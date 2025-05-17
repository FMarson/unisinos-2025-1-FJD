extends Control

func _on_bt_voltar_pressed() -> void:
	get_tree().change_scene_to_file("res://menu_inicial.tscn")
