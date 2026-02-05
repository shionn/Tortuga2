extends "res://scripts/pnj.gd"

func on_interact() -> void:
	gui.open_dialog(pnj_name, _TEXT_DEFAULT).with_options([
		Dialogs.default_search_forbid_fruit_option(self),
		Dialogs.default_search_forbid_fruit_montain_option(self),
		PnjDialogOption.new(
			func(): return tags.have(Tags.FORBID_FRUIT_SEARCH_TELEPORT),
			Dialogs.question_search_forbid_fruit_teleport,
			func(): gui.open_dialog(pnj_name, _TEST_SEARCH_CRYSTAL_TELEPORT)
		),
		Dialogs.default_hung_connut_search_charpentier(self),
		Dialogs.default_hung_connut_search_wood(self),
		Dialogs.default_hung_connut_search_houblon(self),
		Dialogs.default_search_wind(self)
	])


func on_item_drop(item : Item) -> void:
	if item.name == Bag.TresorBarbeDrue :
		gui.open_dialog(pnj_name, _TEXT_TRESOR_BARBE_DRUE)
		bag.unloot(Bag.TresorBarbeDrue)
		bag.loot(Bag.TresorBarbeDrueNet)
	elif item.name == Bag.TresorHungConnut :
		gui.open_dialog(pnj_name, _TEXT_TRESOR_BARBE_DRUE)
		bag.unloot(Bag.TresorHungConnut)
		bag.loot(Bag.TresorHungConnutNet)
	else :
		super.on_item_drop(item)

const _TEXT_DEFAULT = """Ceci est la réserve d'or. 

Entrée interdite sans l'autorisation du Capitaine!"""

const _TEXT_TRESOR_BARBE_DRUE = """J’enregistre ton dépôt auprès du registre des taxes sur les gains afférents aux affaires de la piraterie."""

const _TEST_SEARCH_CRYSTAL_TELEPORT = """Je ne m’en souviens pas trop, on cherchait un truc. 

Je venais de me faire recruter et j'étais tout le temps sous la surveillance de Harvey. Il pourra t’en dire plus."""
