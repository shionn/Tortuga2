extends "res://scripts/interactable.gd"

@onready var _tags = $"/root/World/Player/Tags" as Tags

func _ready() -> void:
	_tags.on_tag_change.connect(on_tag_change)

func on_tag_change() -> void:
	visible = not _tags.have(Tags.ESCALATOR_CHAMPI_REPAIR)


func on_interact() -> void:
	if player.tags.have(Tags.HUNG_CONNUT_SEARCH_ESCALTOR):
		gui.open_alert("Escalator détruit", _TEXT_SEARCH)
	else : 
		gui.open_alert("Escalator détruit", _TEXT)
	player.tags.add(Tags.HUNG_CONNUT_SEARCH_CHARPENTIER)

const _TEXT_SEARCH = """Ho non l’escalator est détruit.
Je ne peux pas le réparer seul, je dois trouver de l’aide."""

const _TEXT = """Ho non l’escalator est détruit."""
