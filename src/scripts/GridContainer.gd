extends GridContainer
export (PackedScene) var base_level
export (NodePath) var grid
onready var Level_gen = preload("res://scene//Level_generator.tscn") 
#count file in directory level
var unlock_level
onready var total_level = len(Autoload.files)

func save_file():
	var config = ConfigFile.new()
	config.set_value("Player1", "unlock_level", 21)
	config.save("user://save_data.cfg")

func load_file():
	var config = ConfigFile.new()
	var err = config.load("user://save_data.cfg")
	if err != OK:
		return
	
	unlock_level = config.get_value("Player1", "unlock_level")

func _ready():
	#save_file()
	load_file()
	grid = get_node(grid)
	for i in range(0,total_level):
		generate_button(i + 1)
	

func generate_button(name : int):
	var level_gen = Level_gen.instance()
	level_gen.set_name(str(name))
	level_gen.get_child(1).text = str(name)
	if name > unlock_level + 1:
		level_gen.get_child(2).visible = true
		level_gen.get_child(0).modulate = Color(1,1,1, 0.5)
	level_gen.level_path = (name) # Onclick change to exact level
	level_gen.obj = get_parent().get_parent().get_parent().get_parent().get_child(1)
	self.add_child(level_gen)
	
	
