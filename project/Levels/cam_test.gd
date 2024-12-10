extends Camera


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _input(event):
#	if event is InputEventMouseMotion:
#		var x = -event.relative.y
#		var y = -event.relative.x
#		rotation.x += x/1000
#		global_rotation.y += y/1000
	if event is InputEventScreenDrag:
		var x = event.relative.y
		var y = event.relative.x
		rotation.x += x/500
		global_rotation.y += y/500


func _physics_process(delta):
	var fw = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	var sw = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	var vel = Vector3(sw, 0, fw).normalized()
	translate(vel)
