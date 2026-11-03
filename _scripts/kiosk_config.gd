extends Panel

func _on_home_pressed() -> void:
	get_tree().change_scene_to_file("res://_scenes/main.tscn")
