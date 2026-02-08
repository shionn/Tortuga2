extends Interactable

func on_interact() -> void:
	if bag.contain(Bag.Champignon):
		player.play_anim_no()
		gui.open_dialog_next(Dialog.playerSay(player, "J'ai assez de Champignon."))
	elif randi_range(0,100) > 90:
		visible = false
		bag.loot(Bag.Champignon)
	else:
		visible = false
		gui.open_dialog_next(Dialog.playerSay(player, "Il est pourri celui-la."))
