extends Spatial

export (float) var smooth_speed = 2.0

onready var tracker = $PlayerCol
onready var smooth = $SmoothMove


func _ready():
	update_inventory()
	update_score()
	PlayerStats.connect("inventory_changed", self, "update_inventory")
	PlayerStats.connect("score_changed", self, "update_score")
	var body = PlayerStats.body.instance()
	var eyes = PlayerStats.eyes.instance()
	var mouth = PlayerStats.mouth.instance()
	$SmoothMove/Model.add_child(body)
	$SmoothMove/Model.add_child(eyes)
	$SmoothMove/Model.add_child(mouth)


func _process(delta):
	smooth.translation = lerp(smooth.translation, tracker.translation, smooth_speed * delta)


func update_score():
	$HUD/Stats/Score/ScoreLabel.text = str(PlayerStats.player_score)

func update_inventory():
	$HUD/Stats/Inventory/InvLabel.text = str(PlayerStats.inventory)


func _on_Label_pressed():
	PlayerStats.choose_avatar()