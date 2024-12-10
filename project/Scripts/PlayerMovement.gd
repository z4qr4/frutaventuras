extends StaticBody

export var map_size: Vector2


func _physics_process(delta):
	
	position = gps_to_godot(PlayerStats.lat, PlayerStats.lon)
	
#	var fw = int(Input.is_action_pressed("bw")) - int(Input.is_action_pressed("fw"))
#	var sw = int(Input.is_action_pressed("sr")) - int(Input.is_action_pressed("sl"))
#
#	translate(Vector3(sw, 0, fw)/10)


func gps_to_godot(lat: float, lon: float) -> Vector3:
	"""
	Convierte coordenadas GPS a posición en el espacio de Godot.

	:param lat: Latitud en grados GPS.
	:param lon: Longitud en grados GPS.
	:return: Vector3 con la posición traducida en el espacio de Godot.
	"""
	# Coordenadas del bounding box en grados GPS
	var north = -12.0507
	var south = -12.062
	var east = -77.0787
	var west = -77.0888

	# Centro del mapa en GPS
	var center_lat = (north + south) / 2.0
	var center_lon = (east + west) / 2.0

	# Dimensiones del bounding box en grados
	var lat_range = abs(north - south)
	var lon_range = abs(east - west)

	# Escalado a unidades de Godot (1:1)
	var scale_x = 1 / lon_range  # Unidades por grado de longitud
	var scale_y = 1 / lat_range  # Unidades por grado de latitud

	# Desplazamiento relativo desde el centro del mapa en grados GPS
	var delta_lat = lat - center_lat
	var delta_lon = lon - center_lon

	# Conversión a espacio de Godot (considerando escala 1:1)
	var godot_x = delta_lon * lon_range
	var godot_y = delta_lat * lat_range

	# Retorna la posición en 3D (asumiendo que Z es fijo, por ejemplo, 0 para el suelo)
	return Vector3(godot_x, 0, godot_y)
