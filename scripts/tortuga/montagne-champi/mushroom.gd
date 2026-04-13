extends Interactable

func on_interact() -> void:
	if bag.contain(Bag.Champignon):
		gui.open_dialog_next(Dialog.playerSay(player, "J'ai assez de Champignon."))
		player.play_anim_no()
	elif randi_range(0,100) > 90:
		visible = false
		bag.loot(Bag.Champignon)
		player.play_anim_interact()
	else:
		visible = false
		gui.open_dialog_next(Dialog.playerSay(player, "Il est pourri celui-la."))
