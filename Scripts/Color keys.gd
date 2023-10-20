extends Control

func _ready():
	pass 

func _on_ColorbuttonWhite_pressed():
	$Chime1.play()
func _on_ColorbuttonBlue_pressed():
	$Chime2.play()
func _on_ColorbuttonGreen_pressed():
	$Chime3.play()
func _on_ColorbuttonYellow_pressed():
	$Chime4.play()
func _on_ColorbuttonRed_pressed():
	$Chime5.play()
