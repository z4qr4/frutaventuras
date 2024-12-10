extends Spatial

signal snatched


func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventScreenTouch && event.pressed:
		pressed()
	elif event is InputEventMouseButton:
		pressed()


func pressed():
	PlayerStats.add_inventory(1)
	emit_signal("snatched")
	queue_free()
