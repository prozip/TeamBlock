extends Button

onready var pic1 = preload("res://assets/tut/MicrosoftTeams-image (1).png")
onready var pic2 = preload("res://assets/tut/MicrosoftTeams-image (2).png")
onready var pic3 = preload("res://assets/tut/MicrosoftTeams-image (3).png")
onready var pic4 = preload("res://assets/tut/MicrosoftTeams-image (4).png")
onready var pic6 = preload("res://assets/tut/MicrosoftTeams-image (6).png")

func _ready():
	if Autoload.current_level == 0:
		$tut.texture = pic1
		get_parent().get_child(0).get_child(0).texture = pic6
		get_parent().get_child(0).visible = true
	elif Autoload.current_level == 1:
		$tut.texture = pic2
	elif Autoload.current_level == 13:
		$tut.texture = pic3
	elif Autoload.current_level == 14:
		$tut.texture = pic4
	else:
		self.visible = false

func _on_Button_pressed():
	self.visible = false

func _on_Button2_pressed():
	get_parent().get_child(0).visible = false
