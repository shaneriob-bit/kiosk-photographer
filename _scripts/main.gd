extends Panel

func _on_order_lookup_button_pressed():
	get_tree().change_scene_to_file("res://_scenes/order_view.tscn")

func _on_order_number_text_text_submitted(_new_text):
	get_tree().change_scene_to_file("res://_scenes/order_view.tscn")

func _on_name_search_button_pressed() -> void:
	get_tree().change_scene_to_file("res://_scenes/photo_search_view.tscn")


func _on_kiosk_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://_scenes/kiosk_config.tscn")
