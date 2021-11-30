extends Spatial

onready var Wall = preload("res://scene/wall.tscn")
onready var Ground = preload("res://scene//ground.tscn")
onready var Target = preload("res://scene//target.tscn")
onready var TargetGround = preload("res://scene//target_ground.tscn")
onready var Block = preload("res://scene//Block.tscn")
onready var ExtendBlock = preload("res://scene//ExtendBlock.tscn")
onready var Hole = preload("res://scene//hole.tscn")
onready var Lava = preload("res://scene//lava.tscn")
onready var MainBlock = $MainBlock

var width = 0
var height = 0
var map = []

func addBlock(character, location):
	if character == "1":
		var extendBlock = ExtendBlock.instance()
		extendBlock.transform.origin = Vector3(location.x - MainBlock.point.x, 0.5, location.y - MainBlock.point.z)
		extendBlock.connect("collide", self, "on_collide")
		MainBlock.add_child(extendBlock)
		addBlock("o", location)
	
	elif character == "3":
		var target = Target.instance()
		target.transform.origin = Vector3(location.x, 0.55, location.y)
		target.name = "Block("+str(location.x)+","+str(location.y)+")"
		target.get_child(1).get_child(0).visible = true
		add_child(target)
		Autoload.target_block += 1
		Autoload.target_map.append(target)
		var target_ground = TargetGround.instance()
		target_ground.transform.origin = Vector3(location.x, 0.5, location.y)
		target_ground.name = "Target("+str(location.x)+","+str(location.y)+")"
		add_child(target_ground)
	
	elif character =="4":
		var target = Target.instance()
		target.transform.origin = Vector3(location.x, 0.55, location.y)
		target.name = "Block("+str(location.x)+","+str(location.y)+")"
		target.get_child(1).get_child(1).visible = true
		add_child(target)
		Autoload.target_lava += 1
		Autoload.target_map.append(target)
		addBlock("o", location)
	
	elif character == "2":
		var block = Block.instance()
		block.transform.origin = Vector3(location.x, 1, location.y)
		block.name = "Block("+str(location.x)+","+str(location.y)+")"
		add_child(block)
		addBlock("o", location)
	
	elif character == "0":
		var hole = Hole.instance()
		hole.transform.origin = Vector3(location.x, 1, location.y)
		add_child(hole)
	
	elif character == "l":
		var lava = Lava.instance()
		lava.transform.origin = Vector3(location.x, 0.92, location.y)
		add_child(lava)
		
	
	elif character == "x":
		var wall = Wall.instance()
		add_child(wall)
		$wall.transform.origin = Vector3(location.x, 1, location.y)
		$wall.name = "Block("+str(location.x)+","+str(location.y)+")"

	elif character == "o":
		var ground = Ground.instance()
		ground.transform.origin = Vector3(location.x, 0.5, location.y)
		ground.name = "Block("+str(location.x)+","+str(location.y)+")"
		add_child(ground)

func read_file(filename):
	var file = File.new()
	file.open(Autoload.path + filename, File.READ)	
	var line
	while !file.eof_reached():
		line = file.get_csv_line()
		if line.size() > 1:
			map.append(line)
			if line.size() > width:
				width = line.size()
			height += 1
	file.close()

func generate_map():
	var line
	var character
	for i in len(map):
		line = map[i]
		for j in len(line):
			character = line[j]
			addBlock(character, Vector2(i,-j))
			
func _ready():
	read_file(Autoload.files[Autoload.current_level])
	generate_map()
	
func on_collide(obj, geo):
	addBlock("1", Vector2(geo.x, geo.z))

func restart():
	Autoload.full_reset()
	get_tree().change_scene("res://scene/level.tscn")

func _on_Button_pressed():
	restart()

func _on_Button2_pressed():
	if Autoload.current_level != 0:
		Autoload.current_level -= 1
	restart()

func _on_Button3_pressed():
	if Autoload.current_level != len(Autoload.files) -1:
		Autoload.current_level += 1
	restart()


func _on_Pause_pressed():
	$MenuContainer/PausePopup.pause_game()
