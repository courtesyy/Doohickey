extends Control

func _ready():
	pass 

func _on_ColorbuttonWhite_pressed():
	if $"../Small buttons/Powerbutton".pressed == false:
		$Chime1.play()
	else:
		$Nochime.play()
func _on_ColorbuttonBlue_pressed():
	if $"../Small buttons/Powerbutton".pressed == false:
		$Chime2.play()
	else:
		$Nochime.play()
func _on_ColorbuttonGreen_pressed():
	if $"../Small buttons/Powerbutton".pressed == false:
		$Chime3.play()
	else:
		$Nochime.play()
func _on_ColorbuttonYellow_pressed():
	if $"../Small buttons/Powerbutton".pressed == false:
		$Chime4.play()
	else:
		$Nochime.play()
func _on_ColorbuttonRed_pressed():
	if $"../Small buttons/Powerbutton".pressed == false:
		$Chime5.play()
	else:
		$Nochime.play()
