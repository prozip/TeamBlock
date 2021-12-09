extends Button
var level_path
var obj

func _on_Button_pressed():
	if !$TextureRect2.visible:
		Autoload.current_level = level_path - 1
		obj.transition_to2('res://scene/level.tscn')
		#get_tree().change_scene("res://scene/level.tscn")
