extends KinematicBody

var is_collide = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func on_collide(lava_check):
	if !is_collide:
		is_collide = true
		if lava_check:
			if $mesh/block2.visible:
				Autoload.target_lava_num += 1
		else:
			Autoload.target_block_num += 1
