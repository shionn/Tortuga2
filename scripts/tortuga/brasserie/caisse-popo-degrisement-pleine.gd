extends "res://scripts/interactable.gd"

func on_interact() -> void:
	if (bag.contain(Bag.PotionDegrisement)) :
		gui.open_dialog_next(Dialog.playerSay(player, """Sur la caisse il est écrit : [i]Potion de dégrisement[/i].

J'en ai déjà."""))
		player.play_anim_no()
	else :
		gui.open_dialog_next(Dialog.playerSay(player, """Sur la caisse il est écrit : [i]Potion de dégrisement[/i].

J'en prend une, cela peut toujours servir.""").on_close(func():bag.loot(Bag.PotionDegrisement)))

func on_tag_change() -> void:
	visible = player.tags.have(Tags.BRASSERIE_HAVE_SOBERING_POTION)
