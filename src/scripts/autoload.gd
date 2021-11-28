extends Node

onready var current_level = 0
onready var path = "res://level//"
onready var files = []

var move = [true, true, true, true]
var target_block = 0
var target_block_num = 0
var target_lava = 0
var target_lava_num = 0
var target_map = []
var move_count
var next_scene_path 

class custom_sorter:
	static func sort_ascending(a, b):
		var num_a = int(a.substr(5, len(a) -9))
		var num_b = int(b.substr(5, len(b) -9))
		if num_a < num_b:
			return true
		return false

func _ready():
	print('global run')
	load_level()

func load_level():
	files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			files.append(file)
	dir.list_dir_end()
	files.sort_custom(custom_sorter, "sort_ascending")

	
	
func full_reset():
	move = [true, true, true, true]
	target_block = 0
	target_block_num = 0
	target_lava = 0
	target_lava_num = 0
	target_map = []
	
func reset_move():
	for i in len(move):
		move[i] = true
	
func reset_target():
	target_block_num = 0
	target_lava_num = 0
	for i in len(target_map):
		target_map[i].is_collide = false
