extends ColorRect

#path of next scren
export(String, FILE, "*.tscn") var next_scene_path
#Reference to the animation node
onready var _anim_player := $AnimationPlayer

func black_out():
	$Panel2.visible = false
	$"loading circle".visible = false
	$line.visible = false
	$TextureRect.visible = false

func black_in():
	$Panel2.visible = true
	$"loading circle".visible = true
	$line.visible = true
	$TextureRect.visible = true

func _ready() -> void: 
	#play animation backward to face-in
	black_out()
	_anim_player.play_backwards("Fade")

func transition_to(_next_scene := next_scene_path) ->void:
	#Plays the Fade animation and wait until it finisheds
	_anim_player.play("Fade")
	yield(_anim_player, "animation_finished")
	#changes the scene 
	get_tree().change_scene(_next_scene)

func transition_to2(_next_scene := next_scene_path) ->void:
	#Plays the Fade animation and wait until it finisheds
	black_in()
	_anim_player.play("Fade")
	yield(_anim_player, "animation_finished")
	#changes the scene 
	get_tree().change_scene(_next_scene)
