extends Control


func _ready():
	pass


func _on_SliderL_scrolling():
	if $Scroll1.playing == false:
		$Scroll1.play()


func _on_SliderR_scrolling():
	if $Scroll1.playing == false:
		$Scroll1.play()
