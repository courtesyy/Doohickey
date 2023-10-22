extends TextureButton


func _ready():
	pass


func _on_PairButtons_toggled(button_pressed):
	if button_pressed == true:
		$Heavypress1.play()
		$"../../../Monitor/Line2D".antialiased = true
	if button_pressed == false:
		$Heavypress2.play()
		$"../../../Monitor/Line2D".antialiased = false
