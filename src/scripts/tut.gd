extends Button

onready var pic1 = preload("res://assets/tut/MicrosoftTeams-image (1).png")
onready var pic2 = preload("res://assets/tut/MicrosoftTeams-image (2).png")
onready var pic3 = preload("res://assets/tut/MicrosoftTeams-image (3).png")
onready var pic4 = preload("res://assets/tut/MicrosoftTeams-image (4).png")

func _ready():
	if Autoload.current_level == 0:
		$tut.texture = pic1
	elif Autoload.current_level == 1:
		$tut.texture = pic2
	elif Autoload.current_level == 13:
		$tut.texture = pic3
	elif Autoload.current_level == 14:
		$tut.texture = pic4
	else:
		self.visible = false
	#elif Autoload.current_level == 


func _on_Button_pressed():
	self.visible = false`
