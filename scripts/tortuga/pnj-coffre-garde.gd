extends "res://scripts/pnj.gd"

func on_interact() -> void:
	gui.open_dialog_next(Dialog.pnjSay(self, _TEXT_DEFAULT)
		.option_search_forbid_fruit()
		.option_search_forbid_fruit_montain()
		.option_dialog(
			Dialog.SEARCH_TELEPRT_CRUSTAL[0],
			Dialog.playerSay(player, Dialog.SEARCH_TELEPRT_CRUSTAL[1])
				.next(Dialog.pnjSay(self, _TEST_SEARCH_CRYSTAL_TELEPORT)),
			func(): return tags.have(Tags.FORBID_FRUIT_SEARCH_TELEPORT) and not bag.contain(Bag.CrystalTeleportationOasis))
		.option_hung_connut_search_charpentier()
		.option_hung_connut_search_wood()
		.option_hung_connut_search_houblon()
		.option_search_wind()
	)

func on_item_drop(item : Item) -> void:
	if item.name == Bag.TresorBarbeDrue :
		gui.open_dialog_next(Dialog.pnjSay(self,_TEXT_TRESOR_BARBE_DRUE))
		bag.unloot(Bag.TresorBarbeDrue)
		bag.loot(Bag.TresorBarbeDrueNet)
	elif item.name == Bag.TresorHungConnut :
		gui.open_dialog_next(Dialog.pnjSay(self,_TEXT_TRESOR_BARBE_DRUE))
		bag.unloot(Bag.TresorHungConnut)
		bag.loot(Bag.TresorHungConnutNet)
	else :
		super.on_item_drop(item)

const _TEXT_DEFAULT = """Ceci est la réserve d'or. 

Entrée interdite sans l'autorisation du Capitaine!"""

const _TEXT_TRESOR_BARBE_DRUE = """J’enregistre ton dépôt auprès du registre des taxes sur les gains afférents aux affaires de la piraterie."""

const _TEST_SEARCH_CRYSTAL_TELEPORT = """Je ne m’en souviens pas trop, on cherchait un truc. 

Je venais de me faire recruter et j'étais tout le temps sous la surveillance de Harvey. Il pourra t’en dire plus."""
