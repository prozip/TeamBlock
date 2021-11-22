extends MarginContainer


func _on_NewGame_pressed():
	get_tree().change_scene("res://scene/level.tscn")


func _on_Continues_pressed():
	get_tree().change_scene("res://scene/Continues.tscn")


func _on_Quit_Game_pressed():
	get_tree().quit()
