extends Panel

# order info variables
@export var order_number = 1657
@export var order_name = "Shane Bernstein"
@export var prints_ordered = 1
@export var emails_ordered = 1
@export var payment_method = "Cash"
@export var price = 39.99

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://_scenes/main.tscn")

func _ready():
	for child in get_children():
		if child is ConfirmationDialog:
			var dialogue_label : Label = $UnpaidShootConfirmation.get_label()
			dialogue_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	$InformationContainer/Price.text = "Price: $" + str(price)
	$InformationContainer/PaymentMethod.text = "Payment Method: " + payment_method
	$InformationContainer/PrintCount.text = "Prints Ordered: " + str(prints_ordered)
	$InformationContainer/EmailCount.text = "Emails Ordered: " + str(emails_ordered)
	
	if prints_ordered == 0:
		$StampContainer/PicturesPrinted.hide()
		$StampContainer/PicturesPickedUp.hide()
	
	if emails_ordered == 0:
		$StampContainer/EmailsSent.hide()

func _on_shoot_photos_pressed():
	if $StampContainer/IsPaid/CheckBox.button_pressed == false:
		$UnpaidShootConfirmation.show()
	else:
		get_tree().change_scene_to_file("res://_scenes/photo_view.tscn")

func _on_unpaid_shoot_confirmation_confirmed():
	get_tree().change_scene_to_file("res://_scenes/photo_view.tscn")
