extends Spatial

var geo
signal collide

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func run(body, direction, num):
	geo = body.transform.origin
	if body.is_in_group("block"):
		body.queue_free()
		emit_signal("collide","Block", geo)
	elif body.is_in_group("wall"):
		Autoload.move[num] = false
		print("wall", direction)

func _on_Area_body_entered(body):
	run(body, $box_wooden_3_LOD0/Area.transform.origin, 3)

func _on_Area2_body_entered(body):
	run(body, $box_wooden_3_LOD0/Area2.transform.origin, 2)

func _on_Area3_body_entered(body):
	run(body, $box_wooden_3_LOD0/Area3.transform.origin, 1)

func _on_Area4_body_entered(body):
	run(body, $box_wooden_3_LOD0/Area4.transform.origin, 0)

func _on_Area5_body_entered(body):
	if body.is_in_group("target"):
		body.on_collide()
	elif body.is_in_group("hole"):
		$AnimationPlayer.play("fall")
		#self.queue_free()
