extends Node2D

func list_files_in_directory(path):
	var files = []
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
	return files
	
func read_file(filename):
	var file = File.new()
	file.open("..//level//" + filename, File.READ)
	var line 
	while !file.eof_reached():
		line = file.get_csv_line()
		if line.size() > 1:
			print(line)

	file.close()
	
func _ready():
	var files = list_files_in_directory("..//level")
	for filename in files:
		read_file(filename)
