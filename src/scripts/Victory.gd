extends Control

func _ready():
	$Panel/Label.text = " :  "+ str(Autoload.move_count)
	
func restart():
	Autoload.full_reset()
	get_tree().change_scene("res://scene/level.tscn")

func _on_Next_pressed():
	if Autoload.current_level != len(Autoload.files) -1:
		Autoload.current_level += 1
	restart()

func _on_Replay_pressed():
	restart()

func _on_Home_pressed():
	get_tree().change_scene("res://scene/MainMenu.tscn")
