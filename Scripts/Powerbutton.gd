extends TextureButton

func _ready():
	pass 

func _on_Powerbutton_toggled(button_pressed):
	if button_pressed == true:
		$Switch1.play()
	if button_pressed == false:
		$Switch2.play()
