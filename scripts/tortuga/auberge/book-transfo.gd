extends Interactable

func on_interact() -> void:
	gui.open_dialog_next(
		Dialog.playerSay(player, "Tiens tiens ca serai pas le livre de Kerim.")
	)
	bag.loot(Bag.LivreTransfo)
	player.play_anim_interact()

func on_tag_change() -> void:
	visible = tags.have(Tags.KNOW_MAYA_THROW_BOOK_TRANSFOPAPER) and not bag.contain(Bag.LivreTransfo) and not tags.have(Tags.FOUND_CARTOGRAPH)

func on_item_change() -> void:
	visible = tags.have(Tags.KNOW_MAYA_THROW_BOOK_TRANSFOPAPER) and not bag.contain(Bag.LivreTransfo) and not tags.have(Tags.FOUND_CARTOGRAPH)
