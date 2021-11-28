extends Control

export(bool) var pause_menu = false

onready var node_main := $Main
onready var node_pause := $Pause
onready var node_levels := $Levels
onready var node_settings := $Settings

signal change_menu
signal exit_menu
signal resume_game
func _ready():
	show_menu(0, true)
	# Pause
	$Pause/VBoxContainer/Button1.connect("pressed", self, "resume_game")
	$Pause/VBoxContainer/Button2.connect("pressed", self, "reload_level")
	$Pause/VBoxContainer/Button3.connect("pressed", self, "show_menu", [2])
	$Pause/VBoxContainer/Button4.connect("pressed", self, "load_mainmenu")

	
	# Settings
	$Settings/HBoxContainer/BackButton.connect("pressed", self, "show_menu", [0])

func load_level(path: String):
	#Game.goto_scene_fade(path)
	emit_signal("exit_menu")

func load_mainmenu():
	get_tree().change_scene("res://scene/MainMenu.tscn")
	emit_signal("exit_menu")

func resume_game():
	emit_signal("resume_game")

func reload_level():
	get_tree().change_scene("res://scene/level.tscn")	
	emit_signal("exit_menu")

func show_menu(index: int, silent: bool = false):
	node_pause.visible = index == 0 and pause_menu
	node_settings.visible = index == 2

func exit_game():
	get_tree().quit()
