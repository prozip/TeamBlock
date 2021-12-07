extends Control

func save_file():
	var config = ConfigFile.new()
	config.set_value("Player1", "unlock_level", Autoload.current_level + 1)
	config.save("user://save_data.cfg")

func _ready():
	save_file()
	if Autoload.current_level > 9:
		if Autoload.current_level < 20:
			$Panel.get_stylebox("panel", "").texture = load("res://assets/Congrat/You win Lava.png")
		else:
			$Panel.get_stylebox("panel", "").texture = load("res://assets/Congrat/You win Snow.jpg")
	$Panel/Label.text = " :  "+ str(Autoload.move_count)
	
func restart():
	Autoload.full_reset()
	SceneChanger.goto_scene("res://scene/level.tscn", self)
	#get_tree().change_scene("res://scene/level.tscn")

func _on_Next_pressed():
	if Autoload.current_level != len(Autoload.files) -1:
		Autoload.current_level += 1
	restart()

func _on_Replay_pressed():
	restart()

func _on_Home_pressed():
	SceneChanger.goto_scene("res://scene/MainMenu.tscn", self)
	#get_tree().change_scene("res://scene/MainMenu.tscn")
