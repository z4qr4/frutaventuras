class_name Saver
extends Resource

export (String) var player_name = "Manolo"
export (int) var player_score = 0
export (int) var inventory = 0
export (PackedScene) var body
export (PackedScene) var eyes
export (PackedScene) var mouth

const SAVED_GAME = "user://savedgame.tres"

func save():
	ResourceSaver.save(SAVED_GAME, self)

func load_game() -> Resource:
	if ResourceLoader.exists(SAVED_GAME):
		return load(SAVED_GAME)
	else: return null
