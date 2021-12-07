extends ColorRect

#path of next scren
export(String, FILE, "*.tscn") var next_scene_path
#Reference to the animation node
onready var _anim_player := $AnimationPlayer

func _ready() -> void: 
	#play animation backward to face-in
	_anim_player.play_backwards("Fade")

func transition_to(_next_scene := next_scene_path) ->void:
	#Plays the Fade animation and wait until it finisheds
	_anim_player.play("Fade")
	yield(_anim_player, "animation_finished")
	#changes the scene 
	SceneChanger.goto_scene(_next_scene, get_parent().get_parent())
	#get_tree().change_scene(_next_scene)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
