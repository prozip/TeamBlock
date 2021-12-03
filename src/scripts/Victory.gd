extends Control

func save_file():
	var config = ConfigFile.new()
	config.set_value("Player1", "unlock_level", Autoload.current_level + 1)
	config.save("user://save_data.cfg")

func _ready():
	save_file()
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
