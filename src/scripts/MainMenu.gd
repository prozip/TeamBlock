extends Panel


func _on_NewGame_pressed():
	Autoload.full_reset()
	Autoload.current_level = 0
	SceneChanger.goto_scene("res://scene/level.tscn", self)
	#get_tree().change_scene("res://scene/level.tscn")


func _on_Continues_pressed():
	Autoload.full_reset()
	SceneChanger.goto_scene("res://scene/Continues.tscn", self)
	
	#get_tree().change_scene("res://scene/Continues.tscn", self)


func _on_Quit_Game_pressed():
	get_tree().quit()
