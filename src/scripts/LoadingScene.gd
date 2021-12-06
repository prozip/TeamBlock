extends Control

export var next_scene = ""
var load_time = 3
onready var tween = $Tween

func _ready():
	tween.interpolate_property($LoadingBar, "value", 0, 100, load_time, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.start()	


func _on_Tween_tween_all_completed():
	if next_scene!= null:
		get_tree().change_scene(next_scene)
