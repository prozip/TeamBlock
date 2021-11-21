extends KinematicBody

var velocity = Vector3()
var SPEED = 10
var direction = Vector3()
var can_move = true

var point

func _ready():
	print("main block run")
	point = transform.origin
	
func _input(event):
	if can_move:
		if event.is_action_released("right") && Autoload.move[0]:
			Autoload.reset_move()
			point = transform.origin + Vector3(0,0,-1)
			can_move = false
		elif event.is_action_released("left") && Autoload.move[1]:
			Autoload.reset_move()
			point = transform.origin + Vector3(0,0,1)
			can_move = false
		elif event.is_action_released("up") && Autoload.move[2]:
			Autoload.reset_move()
			point = transform.origin + Vector3(-1,0,0)
			can_move = false
		elif event.is_action_released("down") && Autoload.move[3]:
			Autoload.reset_move()
			point = transform.origin + Vector3(1,0,0)
			can_move = false
			

func check_win():
	print(Autoload.target_block_num)
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
		
