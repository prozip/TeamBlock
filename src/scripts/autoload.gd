extends Node

var current_level = "level1.csv"
var move = [true, true, true, true]
var target_block = 0
var target_block_num = 0
var target_map = []

func _ready():
	print('global run')

func full_reset():
	move = [true, true, true, true]
	target_block = 0
	target_block_num = 0
	target_map = []
	
func reset_move():
	for i in len(move):
		move[i] = true
	
func reset_target():
	for i in len(target_map):
		target_map[i].is_collide = false
