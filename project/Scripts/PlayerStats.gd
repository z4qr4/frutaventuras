extends Node

export (String) var player_name = "Manolo"
export (int) var player_score = 0
export (int) var inventory = 0
export (PackedScene) var body
export (PackedScene) var eyes
export (PackedScene) var mouth

var lat
var lon

signal score_changed
signal inventory_changed


func _physics_process(delta):
	lat = JavaScript.eval("latitude;")
	lon = JavaScript.eval("longitude;")


func add_score(val: int):
	player_score += val
	emit_signal("score_changed")
	save()
	


func add_inventory(val: int):
	inventory += val
	emit_signal("inventory_changed")
	save()


func save():
	var saver = Saver.new()
	saver.player_name = player_name
	saver.player_score = player_score
	saver.inventory = inventory
	saver.body = body
	saver.eyes = eyes
	saver.mouth = mouth
	saver.save()


func load_game():
	var loader = Saver.new()
	var saver = loader.load_game()
	if saver != null:
		player_name = saver.player_name
		player_score = saver.player_score
		inventory = saver.inventory
		body = saver.body
		eyes = saver.eyes
		mouth = saver.mouth
		load_world()
	else: choose_avatar()


func load_world():
	get_tree().change_scene("res://Levels/World.tscn")


func choose_avatar():
	get_tree().change_scene("res://Levels/ChooseAvatar.tscn")
