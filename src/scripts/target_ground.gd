extends Spatial

func _ready():
	var index = int(Autoload.current_level / 10)
	$mesh.get_child(index).visible = true
