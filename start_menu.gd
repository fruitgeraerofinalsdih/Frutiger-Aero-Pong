extends Control



func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://src/ball/world.tscn")
	



func _on_start_button_2_pressed():
	get_tree().quit()
