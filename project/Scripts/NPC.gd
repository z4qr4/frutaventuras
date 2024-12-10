class_name NPC
extends Spatial

enum types {EDIBLE, INFECTED}

export (String) var npc_name
export (types) var type
export (String) var bio
export (String) var sickness
export (PoolStringArray) var symptoms

const edible_screen = "res://Levels/Screens/Ligue.tscn"
const help_sreen = "res://Levels/Screens/Ayuda.tscn"

const names = [
	"Meliza Cotona",
	"Sandra Durazna",
]


func random():
	randomize()
	type = randi()%2
	npc_name = names[randi()%names.size()]
	var random_get = AvatarItems.get_random()
	var body = random_get[0].instance()
	var eyes = random_get[1].instance()
	var mouth = random_get[2].instance()
	$Model.add_child(body)
	$Model.add_child(eyes)
	$Model.add_child(mouth)
	


func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventScreenTouch:
		selected()
	elif event is InputEventMouseButton:
		selected()


func selected():
	$Area.visible = false
	var screen
	if type == types.EDIBLE:
		var screen_scene = load(edible_screen)
		screen = screen_scene.instance()
	elif type == types.INFECTED:
		var screen_scene = load(help_sreen)
		screen = screen_scene.instance()
	screen.npc_name = npc_name
	screen.bio = bio
	add_child(screen)
	screen.connect("exit_screen", self, "_on_screen_exit")


func _on_screen_exit(eaten):
	if eaten:
		queue_free()
	else: $Area.visible = true
