extends "res://scripts/interactable.gd"

@export_multiline var desciption : String = "Cette pierre permet de se téléporter mais il me faut la pierre pour l’activer."
@export var return_crystal : String

@onready var _audio = $AudioStreamPlayer

func on_interact() -> void:
	if player.tags.have(Tags.FORBID_FRUIT_SEARCH_TELEPORT) or bag.contain(Bag.CrystalTeleportationOasis):
		gui.open_alert("Téléporteur", desciption)
	else : 
		gui.open_alert("Pierre étrange", """Cette pierre étrange est recouverte de glyphe mais je n’y comprends rien.""")

func on_item_drop(item : Item) -> void:
	if not return_crystal.is_empty() && item.name == return_crystal :
		_audio.play()
		player.teleport(Vector3(75,3,-185), deg_to_rad(1))
	elif item.name == Bag.CrystalTeleportationOasis : 
		_audio.play()
		player.teleport(Vector3(172,105,-253), deg_to_rad(-133))
	else :
		super.on_item_drop(item)
