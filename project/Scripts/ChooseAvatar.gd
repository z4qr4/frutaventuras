extends Control

onready var bodies = $Customizations/Cuerpo/BodyList
onready var eyes = $Customizations/Ojos/EyesList
onready var mouths = $Customizations/Boca/MouthList
onready var display = $ViewportContainer/Viewport/AvatarDisplay


func _ready():
	for body in AvatarItems.bodies:
		var block = ResourceLoader.load(body)
		bodies.add_item(block.block_name)
	for eye in AvatarItems.eyes:
		var block = ResourceLoader.load(eye)
		eyes.add_item(block.block_name)
	for mouth in AvatarItems.mouths:
		var block = ResourceLoader.load(mouth)
		mouths.add_item(block.block_name)



func _on_BodyList_item_selected(index):
	var body = ResourceLoader.load(AvatarItems.bodies[index])
	PlayerStats.body = body.model
	print(body)
	display.set_body(PlayerStats.body)


func _on_EyesList_item_selected(index):
	var eyes = ResourceLoader.load(AvatarItems.eyes[index])
	PlayerStats.eyes = eyes.model
	display.set_eyes(PlayerStats.eyes)


func _on_MouthList_item_selected(index):
	var mouth = ResourceLoader.load(AvatarItems.mouths[index])
	PlayerStats.mouth = mouth.model
	display.set_mouth(PlayerStats.mouth)


func _on_Done_pressed():
	PlayerStats.save()
	PlayerStats.load_world()
