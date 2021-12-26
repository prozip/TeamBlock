extends Spatial

var rng = RandomNumberGenerator.new()


func _ready():
	var index = int(Autoload.current_level / 10)
	$mesh.get_child(index).visible = true
	rng.randomize()
	var num1 = rng.randi_range(-1, 1) *90
	var num2 = rng.randi_range(-1, 1) *90
	var num3 = rng.randi_range(-1, 1) *90
	
	$mesh/block_stone1_1_LOD0.rotation_degrees = Vector3(num1, num2,num3)
