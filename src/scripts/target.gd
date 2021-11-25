extends KinematicBody

var is_collide = false
var type = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func on_collide():
	if !is_collide:
		is_collide = true
		Autoload.target_block_num += 1
