extends "res://scripts/interactable.gd"

func on_interact() -> void:
	gui.open_dialog_next(Dialog.playerSay(player, _TEXT).next(Dialog.playerSay(player, _TEXT_2)
		.on_close(func():tags.add(Tags.HUNG_CONNUT_SEARCH_ESCALTOR))))
	

func on_tag_change() -> void:
	visible = bag.contain(Bag.CarteHungConnut) or tags.have(Tags.HUNG_CONNUT_TEASUR_OPENED)

func on_item_change() -> void:
	visible = bag.contain(Bag.CarteHungConnut) or tags.have(Tags.HUNG_CONNUT_TEASUR_OPENED)

const _TEXT = """Sur le marbre il est écrit :
[i]	Là où le vent souffle très fort,
	tu devra monter,
	car pour approcher mon trésor
	il te faudra le mériter![/i]"""

const _TEXT_2 = """[i]	Au Nord de l'île,
	d’un pas habile et hâté,
	trouve le panneau mobile,
	car il va te mener,
	là où autrement tu ne saurais aller ![/i]"""
