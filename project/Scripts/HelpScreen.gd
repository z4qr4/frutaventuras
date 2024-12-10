extends Control

export (String) var npc_name
export (String) var bio
export (NodePath) var nombre_path
export (NodePath) var description_path
export (NodePath) var opciones_path

onready var nombre = get_node(nombre_path)
onready var description = get_node(description_path)
onready var opciones = get_node(opciones_path)

var its_list
var infection
var infection_name
var cangive: bool

signal exit_screen


func _ready():
	nombre.text = npc_name
	its_list = Its.list()
	randomize()
	infection_name = its_list[randi()%len(its_list)]
	infection = Its.its(infection_name)
	for i in its_list:
		opciones.add_item(i)
	var sintomas = ""
	for sintoma in infection["sintomas"]["general"]:
		sintomas += "\n"
		sintomas += sintoma
	description.text += sintomas
	$confirm.get_cancel().connect("pressed", self, "_on_confirm_canceled")


func _on_Button_pressed():
	var selected = its_list[opciones.selected]
	if selected == infection_name:
		$confirm.window_title = "¡Gracias!"
		if PlayerStats.inventory > 0:
			$confirm.dialog_text = "¡Has acertado!\n¿Le regalarías un profilactico de tu inventario a cambio de un punto adicional?"
			cangive = true
		else:
			$confirm.dialog_text = "¡Has acertado!\nNo tienes profilácticos en tu inventario para regalar esta vez."
			$confirm.get_cancel().disabled = true
			cangive = false
		$confirm.popup_centered()
	else: 
		$fail.window_title = "Fallaste"
		$fail.dialog_text = "La próxima vez lo harás mejor."
		$fail.popup_centered()


func _on_confirm_confirmed():
	if cangive:
		PlayerStats.add_score(2)
		PlayerStats.add_inventory(-1)
	else: PlayerStats.add_score(1)
	emit_signal("exit_screen", true)


func _on_fail_confirmed():
	emit_signal("exit_screen", true)


func _on_confirm_cancel():
	PlayerStats.add_score(1)
	emit_signal("exit_screen", true)
