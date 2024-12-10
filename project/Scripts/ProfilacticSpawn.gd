tool
class_name ProfilacticSpawn
extends Spatial

export (int) var cooldown = 20
export (PackedScene) var profilactic_scene

var timer = Timer.new()


func _ready():
	var marker = Position3D.new()
	add_child(marker)
	spawn()
	timer.one_shot = true
	add_child(timer)
	timer.connect("timeout", self, "spawn")


func spawn():
	var profilactic = profilactic_scene.instance()
	add_child(profilactic)
	profilactic.connect("snatched", self, "child_snatched")


func child_snatched():
	timer.start(cooldown)

