extends Spatial

onready var camera = $turn/tilt/Camera
onready var turn = $turn
onready var tilt = $turn/tilt


func _ready():
	pass

func _input(event):
#	if event is InputEventScreenDrag or event is InputEventMouseMotion:
	if event is InputEventMouseMotion && Input.is_mouse_button_pressed(1):
		var x = event.relative.x
		var y = event.relative.y
		turn.rotation.y += x/500
		tilt.rotation.x += y/500

