extends Node

func _ready():
	randomize()
	Global.Explosions = $Explosions
	Global.Bales = $Bales
	Global.Meteorits = $Meteorits
	Global.Nau = $Nau
	crea_meteorit()
	
func crea_meteorit():
	var nombre_meteorits = len(Global.Meteorits.get_children())
	if nombre_meteorits >= 50:
		return
	# Creem el meteorit
	var nou_meteorit = Global.escena_meteorit.instance()
	nou_meteorit.position = genera_posicio()
	Global.Meteorits.add_child(nou_meteorit)

func genera_posicio():
	var pos = Vector2()

	# Generem una posició aleatòria pel meteorit en un entorn d'una pantalla a dreta i esquerra de l'actual
	var rect = get_viewport().get_visible_rect()
	var camera_centre = $Nau/Camera2D.get_camera_screen_center()
	var max_x = camera_centre.x + 1.5 * rect.size.x
	var min_x = camera_centre.x - 1.5 * rect.size.x
	var max_y = camera_centre.y + 1.5 * rect.size.y
	var min_y = camera_centre.y - 1.5 * rect.size.y
	pos.x = rand_range(min_x, max_x)
	pos.y = rand_range(min_y, max_y)
	var centre = $Nau/Camera2D.get_camera_screen_center()
	var limits = Rect2(centre - rect.size/2, centre + rect.size/2)

	return pos
