extends Camera

var position = Vector2()
var drag_speed = 0.02
var drag_percent = 0.7
var zoom_speed = 0.5

export(int,"disabled","single_drag","multi_drag") var movement_gesture = 2
export(int,"disabled","pinch") var zoom_gesture = 1

onready var target: Object = get_parent().get_node("MainBlock")
export var smooth_speed: float
export var offset: Vector3
onready var current_target_trans = Vector3(0,0.5,0)
onready var default_fov = fov

func _physics_process(delta: float) -> void:
	print(fov, self.translation)
	if(target != null):
		current_target_trans = target.translation - current_target_trans
		self.translation = lerp(self.translation, current_target_trans + offset, smooth_speed * delta)

func set_position(p):
	offset.x = p.y
	offset.z = -p.x
	transform.origin.x = p.y
	transform.origin.z = -p.x
	
func _unhandled_input(event):
	if (event is InputEventMultiScreenDrag and  movement_gesture == 2):
		position.y = transform.origin.x
		position.x = -transform.origin.z
		set_position(position - event.relative * drag_speed * fov / default_fov)
	elif event is InputEventScreenPinch and zoom_gesture == 1:
		zoom(event)

func zoom(event):
	var li = event.distance
	var lf = event.distance + event.relative * zoom_speed
	var zi = fov
	var zf = (li*zi)/lf
	if zf == 0: return
	fov = zf
