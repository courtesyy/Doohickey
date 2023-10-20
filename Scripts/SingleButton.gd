extends TextureButton


func _ready():
	pass


func _on_SingleButton_toggled(button_pressed):
	if button_pressed == true:
		$Toggle2.play()
	if button_pressed == false:
		$Toggle1.play()
