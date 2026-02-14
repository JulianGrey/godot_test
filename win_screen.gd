extends Control

func _on_button_pressed() -> void:
	# 1. Reset the score (optional, since start_game handles it, but good practice)
	GameManager.score = 0
	
	# 2. Reload the main level
	get_tree().change_scene_to_file("res://world.tscn")
