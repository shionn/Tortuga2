extends "res://scripts/interactable.gd"

@export_multiline var desciption : String = "Cette pierre permet de se téléporter mais il me faut le cristal pour l’activer."
@export var return_crystal : String

@onready var _audio = $AudioStreamPlayer

func on_interact() -> void:
	if tags.have(Tags.FORBID_FRUIT_SEARCH_TELEPORT) or bag.contain(Bag.CrystalTeleportationOasis):
		gui.open_dialog_next(Dialog.playerSay(player, desciption))
	else : 
		gui.open_dialog_next(Dialog.playerSay(player,  """Cette pierre étrange est recouverte de glyphe mais je n’y comprends rien."""))

func on_item_drop(item : Item) -> void:
	if not return_crystal.is_empty() && item.name == return_crystal :
		gui.doTransition(_teleport_to_tortuga)
	elif item.name == Bag.CrystalTeleportationOasis : 
		gui.doTransition(_teleport_to_oasis)
	else :
		super.on_item_drop(item)

func _teleport_to_tortuga() -> void: 
	_audio.play()
	player.teleport(Vector3(75.0,3.0,-185.0), deg_to_rad(1.0))

func _teleport_to_oasis() -> void: 
	_audio.play()
	player.teleport(Vector3(172.0,105.0,-253.0), deg_to_rad(-133.0))
	tags.remove(Tags.FORBID_FRUIT_SEARCH_MONTAGNE)
