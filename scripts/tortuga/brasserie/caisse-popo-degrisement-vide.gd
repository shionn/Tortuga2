extends "res://scripts/interactable.gd"

func on_interact() -> void:
	gui.open_dialog_next(Dialog.playerSay(player, """Sur la caisse il est écrit : [i]Potion de dégrisement[/i].

Malheureusement cette caisse est vide."""))
	player.play_anim_no()

func on_tag_change() -> void:
	visible = not player.tags.have(Tags.BRASSERIE_HAVE_SOBERING_POTION)
