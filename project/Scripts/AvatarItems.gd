extends Node

var models_path = "res://Graphics/BuildingBlocks/"

var bodies: Array = []
var eyes: Array = []
var mouths: Array = []


func _ready():
	var bodies_dir = Directory.new()
	var eyes_dir = Directory.new()
	var mouths_dir = Directory.new()
	bodies_dir.open(models_path + "Bodies/")
	eyes_dir.open(models_path + "Eyes/")
	mouths_dir.open(models_path + "Mouths/")
	bodies = get_files_in_folder(bodies_dir)
	eyes = get_files_in_folder(eyes_dir)
	mouths = get_files_in_folder(mouths_dir)


func get_files_in_folder(folder: Directory):
	var files = []
	folder.list_dir_begin()
	var file_name = folder.get_next()
	while file_name != "":
		if not folder.current_is_dir():
			files.append(str(folder.get_current_dir() + file_name))
		file_name = folder.get_next()
	folder.list_dir_end()
	return files
 
func get_random():
	var body_block = ResourceLoader.load(bodies[randi()%bodies.size()])
	var eye_block = ResourceLoader.load(eyes[randi()%eyes.size()])
	var mouth_block = ResourceLoader.load(mouths[randi()%mouths.size()])
	print(body_block.model)
	print(eye_block.model)
	print(mouth_block.model)
	return [body_block.model, eye_block.model, mouth_block.model]
	
	

