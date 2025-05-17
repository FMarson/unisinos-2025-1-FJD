extends Control

func _on_bt_jogar_pressed() -> void:
	get_tree().change_scene_to_file("res://fase_01.tscn")

func _on_bt_opcoes_pressed() -> void:
	get_tree().change_scene_to_file("res://menu_opcoes.tscn")

func _on_bt_sair_pressed() -> void:
	get_tree().quit()
