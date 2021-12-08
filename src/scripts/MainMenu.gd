extends Panel


func _on_NewGame_pressed():
	Autoload.full_reset()
	Autoload.current_level = 0
	$SceneTransition.transition_to("res://scene/level.tscn")


func _on_Continues_pressed():
	Autoload.full_reset()
	$SceneTransition.transition_to("res://scene/Continues.tscn")


func _on_Quit_Game_pressed():
	get_tree().quit()
