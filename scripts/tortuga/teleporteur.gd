extends "res://scripts/interactable.gd"

@export_multiline var desciption : String = "Cette pierre permet de se téléporter mais il me faut le cristal pour l’activer."
@export var return_crystal : String

@onready var _audio = $AudioStreamPlayer

func on_interact() -> void:
	if tags.have(Tags.FORBID_FRUIT_SEARCH_TELEPORT) or bag.contain(Bag.CrystalTeleportationOasis):
		gui.open_alert("Téléporteur", desciption)
	else : 
		gui.open_alert("Pierre étrange", """Cette pierre étrange est recouverte de glyphe mais je n’y comprends rien.""")

func on_item_drop(item : Item) -> void:
	if not return_crystal.is_empty() && item.name == return_crystal :
		_audio.play()
		player.teleport(Vector3(75.0,3.0,-185.0), deg_to_rad(1.0))
	elif item.name == Bag.CrystalTeleportationOasis : 
		_audio.play()
		player.teleport(Vector3(172.0,105.0,-253.0), deg_to_rad(-133.0))
		tags.remove(Tags.FORBID_FRUIT_SEARCH_MONTAGNE)
	else :
		super.on_item_drop(item)
