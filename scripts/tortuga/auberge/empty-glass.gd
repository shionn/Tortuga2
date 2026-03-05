extends Interactable

func on_interact() -> void:
	gui.open_dialog_next(Dialog.playerSay(player,_DESC))
	if not tags.have(Tags.KAZROG_HAVE_AXE) :
		tags.add(Tags.KAZROG_BOIS_TROP_1)

const _DESC = "Ce verre est vide. 
Kazrog semble les enchainer."
