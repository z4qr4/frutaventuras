extends Spatial


func set_body(new_body: PackedScene):
	for child in $Body.get_children():
		child.queue_free()
	var body = new_body.instance()
	body.name = "body"
	$Body.add_child(body)


func set_eyes(new_eyes: PackedScene):
	for child in $Eyes.get_children():
		child.queue_free()
	var eyes = new_eyes.instance()
	$Eyes.add_child(eyes)


func set_mouth(new_mouth: PackedScene):
	for child in $Mouth.get_children():
		child.queue_free()
	var mouth = new_mouth.instance()
	mouth.name = "eyes"
	$Mouth.add_child(mouth)
