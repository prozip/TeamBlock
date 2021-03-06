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

func _on_Next_pressed():
	if Autoload.current_level != len(Autoload.files) -1:
		Autoload.current_level += 1
	Autoload.full_reset()
	$SceneTransition.transition_to2("res://scene/level.tscn")

func _on_Replay_pressed():
	Autoload.full_reset()
	$SceneTransition.transition_to2("res://scene/level.tscn")

func _on_Home_pressed():
	$SceneTransition.transition_to("res://scene/MainMenu.tscn")
	#get_tree().change_scene("res://scene/MainMenu.tscn")
