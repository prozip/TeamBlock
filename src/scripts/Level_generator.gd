extends Button
var level_path
func _on_Button_pressed():
	Autoload.current_level = level_path - 1
	get_tree().change_scene("res://scene/level.tscn")
	
