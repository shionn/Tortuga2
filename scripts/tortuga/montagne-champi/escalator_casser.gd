extends "res://scripts/interactable.gd"

func _ready() -> void:
	super._ready()
	
		
func on_tag_change() -> void:
	visible = not tags.have(Tags.ESCALATOR_CHAMPI_REPAIR)
	if not visible:
		process_mode = Node.PROCESS_MODE_DISABLED
	else : 
		process_mode = Node.PROCESS_MODE_INHERIT


func on_interact() -> void:
	if tags.have(Tags.HUNG_CONNUT_SEARCH_ESCALTOR):
		gui.open_dialog_next(Dialog.playerSay(player, _TEXT_SEARCH))
	else : 
		gui.open_dialog_next(Dialog.playerSay(player, _TEXT))
	tags.add(Tags.HUNG_CONNUT_SEARCH_CHARPENTIER)

const _TEXT_SEARCH = """Ho non l’escalator est détruit.
Je ne peux pas le réparer seul, je dois trouver de l’aide."""

const _TEXT = """Ho non l’escalator est détruit."""
