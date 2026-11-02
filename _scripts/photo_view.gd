extends Panel

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://_scenes/order_view.tscn")

func _on_shoot_with_cam_pressed():
	$UneditedRect/ShootWithCam.hide()
	$UneditedRect/CameraStatus.show()

func _unhandled_input(event):
	if event is InputEventKey:
		if event.keycode == KEY_F1 and $UneditedRect/CameraStatus.visible == true:
			$UneditedRect/FileName.text = "unedited-1-bkg9.jpg"
			var texture = load("res://_camera_roll/unedited_green_screen_smile.png")
			$UneditedRect.texture = texture
			$UneditedRect/ShootWithCam.show()
			$UneditedRect/CameraStatus.hide()
