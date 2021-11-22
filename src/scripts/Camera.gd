extends Camera

var position = Vector2()
var drag_speed = 0.15

export(int,"disabled","single_drag","multi_drag") var movement_gesture = 2
export(int,"disabled","pinch") var zoom_gesture = 1

func set_position(p):
	transform.origin.x = p.y
	transform.origin.z = -p.x

func _unhandled_input(event):
	if (event is InputEventMultiScreenDrag and  movement_gesture == 2):
		position.y = transform.origin.x
		position.x = -transform.origin.z
		set_position(position - event.relative * drag_speed * fov / 40)
	elif event is InputEventScreenPinch and zoom_gesture == 1:
		zoom(event)

func zoom(event):
	var li = event.distance
	var lf = event.distance + event.relative
	var zi = fov
	var zf = (li*zi)/lf
	if zf == 0: return
	fov = zf
