extends Panel

var backgrounds = [
	load("res://_backgrounds/random-wallpapers-green-lime-background-wallpaper-32549.jpg"),
	load("res://_backgrounds/random-wallpapers-green-lime-background-wallpaper-32549.jpg"),
	load("res://_backgrounds/random-wallpapers-green-lime-background-wallpaper-32549.jpg"),
	load("res://_backgrounds/eiffel_tower_at_night_paris_france-normal.jpg"),
	load("res://_backgrounds/fsu_nat_champs.jpg"),
	load("res://_backgrounds/fsu_nat_champs.jpg"),
]

var unedited_texture = load("res://_camera_roll/unedited_green_screen_smile.png")
var no_img_found_texture = load("res://noImageFound.png")

var unedited_taken = [
	false, 
	false, 
	false,
	false,
	false,
	false
]

func _ready():
	for child in get_children():
		if child is ConfirmationDialog:
			child.get_label().horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://_scenes/order_view.tscn")

func _on_shoot_with_cam_pressed():
	if unedited_taken[$InfoContainer/PhotoSelectionContainer/OptionButton.selected] == true:
		$RetakePhotoConfirmation.show()
		await $RetakePhotoConfirmation.confirmed
		
		$UneditedRect/ShootWithCam.hide()
		$UneditedRect/CameraStatus.show()
	else:
		$UneditedRect/ShootWithCam.hide()
		$UneditedRect/CameraStatus.show()

func _unhandled_input(event):
	if event is InputEventKey:
		if event.keycode == KEY_F1 and $UneditedRect/CameraStatus.visible == true:
			$UneditedRect/FileName.text = "unedited-1-bkg9.jpg"
			$UneditedRect.texture = unedited_texture
			unedited_taken[$InfoContainer/PhotoSelectionContainer/OptionButton.selected] = true
			$UneditedRect/ShootWithCam.show()
			$UneditedRect/CameraStatus.hide()

func _on_option_button_item_selected(index: int) -> void:
	$InfoContainer/TextureRect.texture = backgrounds[index]
	if unedited_taken[$InfoContainer/PhotoSelectionContainer/OptionButton.selected] == true:
		$UneditedRect.texture = unedited_texture
	else:
		$UneditedRect.texture = no_img_found_texture
