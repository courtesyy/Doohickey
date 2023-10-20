extends Control


func _ready():
	pass


func _on_Smallslider1_scrolling():
	if $Scroll2.playing == false:
		$Scroll2.play()

func _on_SmallsliderR_scrolling():
	if $Scroll3.playing == false:
		$Scroll3.play()

func _on_Smallslider2_scrolling():
	if $Scroll4.playing == false:
		$Scroll4.play()
