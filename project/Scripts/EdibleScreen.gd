extends Control

export (String) var npc_name
export (String) var bio
export (NodePath) var nombre_path
export (NodePath) var descripcion_path

onready var nombre = get_node(nombre_path)
onready var descripcion = get_node(descripcion_path)

var eaten: bool

signal exit_screen


func _ready():
	nombre.text = npc_name
	descripcion.text = bio
	$confirm.connect("confirmed", self, "quit")



func _on_ligar_pressed():
	if PlayerStats.inventory > 0:
		eaten = true
		$confirm.window_title = "¡Delicioso!"
		$confirm.dialog_text = "Has saciado tu hambre y has ganado un punto."
		$confirm.popup_centered()
		PlayerStats.add_inventory(-1)
		PlayerStats.add_score(1)
	else:
		eaten = false
		$confirm.window_title = "¡Oh no!"
		$confirm.dialog_text = "No puedes comerte esta fruta porque no tienes protección en tu inventario."
		$confirm.popup_centered()


func _on_pasar_pressed():
	emit_signal("exit_screen", false)
	queue_free()


func quit():
	emit_signal("exit_screen", eaten)
