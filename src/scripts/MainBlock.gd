extends KinematicBody

var velocity = Vector3()
var SPEED = 10
var direction = Vector3()
var can_move = true
var move_count = 0

var start_touch = Vector2()
var end_touch = Vector2()
var swipe

var point

func _ready():
	print("main block run")
	point = transform.origin
	
func detect_swipe():
	#right, up, left, down 0,1,2,3
	if end_touch.x - start_touch.x == 0:
		if end_touch.y - start_touch.y>0:
			swipe = 1
		else:
			swipe = 3
	elif end_touch.x - start_touch.x > 0:
		var ans = (end_touch.y - start_touch.y) / (end_touch.x - start_touch.x)
		var result = rad2deg(atan(ans))
		if result >= -45 && result <= 45:
			swipe = 0
		elif result < -45:
			swipe = 1
		else:
			swipe = 3
	else:
		var ans = (end_touch.y - start_touch.y) / (end_touch.x - start_touch.x)
		var result = rad2deg(atan(ans))
		if result >= -45 && result <= 45:
			swipe = 2
		elif result < -45:
			swipe = 3
		else:
			swipe = 1
	
func _input(event):
	swipe = -1
	if event is InputEventSingleScreenTouch:
		if event.pressed:
			start_touch = event.position
		else:
			end_touch = event.position
			detect_swipe()
	if can_move:
		if (event.is_action_released("right")|| swipe==0) && Autoload.move[0]:
			Autoload.reset_move()
			point = transform.origin + Vector3(0,0,-1)
			can_move = false
		elif (event.is_action_released("left") || swipe == 2) && Autoload.move[1]:
			Autoload.reset_move()
			point = transform.origin + Vector3(0,0,1)
			can_move = false
		elif (event.is_action_released("up") || swipe == 1) && Autoload.move[2]:
			Autoload.reset_move()
			point = transform.origin + Vector3(-1,0,0)
			can_move = false
		elif (event.is_action_released("down") || swipe == 3) && Autoload.move[3]:
			Autoload.reset_move()
			point = transform.origin + Vector3(1,0,0)
			can_move = false

func check_win():
	move_count += 1
	$Label.text = "MOVE: " + str(move_count) 
	if Autoload.target_block_num == Autoload.target_block:
		print('win')
	else:
		Autoload.target_block_num = 0
		Autoload.reset_target()

func _physics_process(delta):
	if !can_move:
		if point.distance_to(transform.origin)>0.05:
			direction = point - transform.origin
			direction = direction.normalized() * SPEED
		else:
			check_win()
			transform.origin = point
			direction = Vector3(0,0,0)
			can_move=true
		move_and_slide(direction)
		
