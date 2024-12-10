class_name NpcSpawner
extends Spatial

export (PackedScene) var npc_scene
export (NodePath) var player
export (int) var cooldown = 60
export (int) var extents = 10

var timer = Timer.new()
var proximity = Area.new()
var box


func _ready():
	timer.one_shot = true
	add_child(timer)
	var shape = CollisionShape.new()
	box = BoxShape.new()
	box.extents = Vector3(extents, 1, extents)
	shape.shape = box
	add_child(proximity)
	proximity.add_child(shape)
	proximity.connect("body_entered", self, "player_detect")


func spawn():
	if timer.is_stopped() && (get_child_count() == 2):
		var npc = npc_scene.instance()
		npc.random()
		add_child(npc)
		timer.start(float(cooldown))


func player_detect(body):
	if body == get_node(player).tracker:
		spawn()

