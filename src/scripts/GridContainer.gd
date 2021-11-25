extends GridContainer
export (PackedScene) var base_level
export (NodePath) var grid
onready var Level_gen = preload("res://scene//Level_generator.tscn") 
#count file in directory level

onready var total_level = len(Autoload.files)

func _ready():
	print(total_level)
	print(int(total_level/4 + total_level % 4))

	grid = get_node(grid)
	for i in range(0,total_level):
		generate_button(i + 1)
	

func generate_button(name : int):
	var level_gen = Level_gen.instance()
	level_gen.set_name(str(name))
	level_gen.get_child(1).text = str(name)
	print(level_gen.get_child(1).text)
	level_gen.level_path = (name) # Onclick change to exact level
	self.add_child(level_gen)
	
	
