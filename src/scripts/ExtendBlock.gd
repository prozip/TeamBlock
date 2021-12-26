extends Spatial

var geo
signal collide

func _ready():
	var index = int(Autoload.current_level / 10)
	$mesh.get_child(index).visible = true

func run_safe(body, direction, num):
	geo = body.transform.origin
	if body.is_in_group("block"):
		body.queue_free()
		emit_signal("collide","Block", geo)
	elif body.is_in_group("wall"):
		Autoload.move[num] = false
		
func run(body, direction, num):
	call_deferred("run_safe", body, direction, num)

func _on_Area_body_entered(body):
	run(body, $area_collections/Area.transform.origin, 3)

func _on_Area2_body_entered(body):
	run(body, $area_collections/Area2.transform.origin, 2)

func _on_Area3_body_entered(body):
	run(body, $area_collections/Area3.transform.origin, 1)

func _on_Area4_body_entered(body):
	run(body, $area_collections/Area4.transform.origin, 0)

func _on_Area5_body_entered(body):
	if body.is_in_group("target"):
		body.on_collide($lava_block.visible)
	elif body.is_in_group("hole"):
		$AnimationPlayer.play("fall")
	elif body.is_in_group("ground"):
		if Autoload.current_level > 19:
			body.get_child(0).visible = false
			body.get_child(2).visible = true
	elif body.is_in_group("ice"):
		if body.get_child(1).visible:
			body.get_child(1).visible = false
		else:
			$AnimationPlayer.play("fall")
	elif body.is_in_group("lava") && !$lava_block.visible:
		$mesh/Spatial/block_stone1_6_LOD1.visible = false
		$mesh/Spatial/DissolvingSphere.dissolve()
		#$mesh.visible = false
		$lava_block.visible = true
