extends Interactable

var pos = _TORTUGA

func on_interact() -> void:
	gui.open_dialog("Voyager","""Aller ou ?""").with_options([
		PnjDialogOption.new(
			func() : return pos != _TORTUGA,
			"""Retourner sur tortuga""",
			func() : gui.doTransition(_goTortuga)
		), PnjDialogOption.new(
			func() : return pos != _SHAMAN_ISLAND ,
			"""Sur l'île de la shaman""",
			func() : gui.doTransition(_goShamanIsland)
		),
	])

func _goTortuga() -> void :
	player.teleport(Vector3(-7.2,1,12.6), deg_to_rad(0))
	global_position.x = -7.2
	global_position.z = 14.7
	global_rotation.y = deg_to_rad(0)
	pos = _TORTUGA
	
func _goShamanIsland() -> void :
	player.teleport(Vector3(279.7,1,96.6), deg_to_rad(114.4))
	global_position.x = 279.7
	global_position.z = 94.5
	global_rotation.y = deg_to_rad(178)
	pos = _SHAMAN_ISLAND


const _TORTUGA = 0
const _SHAMAN_ISLAND = 1
