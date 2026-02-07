extends "res://scripts/pnj.gd"

func on_interact() -> void:
	gui.open_dialog_next(Dialog.pnjSay(self, _TEXT)
		.option_search_forbid_fruit()
		.option_search_forbid_fruit_montain()
		.option_search_forbid_fruit_montain_teleport()
		.option_hung_connut_search_charpentier()
		.option_hung_connut_search_wood()
		.option_dialog(Dialog.SEARCH_HOUBLON[0], 
			Dialog.playerSay(player, Dialog.SEARCH_HOUBLON[1])
				.next(Dialog.pnjSay(self, _SEARCH_HOUBLON)),
			func (): return tags.have(Tags.HUNG_CONNUT_SEARCH_HOUBLON) and not bag.contain(Bag.Houblon))
		.option_search_wind()
	)

func on_item_drop(item : Item) -> void:
	if item.isGold() :
		gui.open_dialog_next(Dialog.pnjSay(self, """Qu’est ce que je vous sers ? """)
			.option_action("""Bière rousse de Eve""", func(): bag.loot(Bag.BiereRousseDeEve), func(): return not bag.contain(Bag.BiereRousseDeEve))
			.option_dialog("""Omelette aux champignons""", Dialog.pnjSay(self, _TEXT_ON_OMELETTE).on_close(func(): tags.add(Tags.KNOW_FERMIER_LOVE_OMELETTE)))
			.option_dialog("Un cocktail", Dialog.pnjSay(self, """C'est Maya la spécialiste en cocktail"""))
		)
	else : 
		super.on_item_drop(item)

const _TEXT = """Bonjour qu'est ce que je vous sert? 
Les clients sont négligents, ils oublient souvent des choses sur les tables. 

N'oubliez rien en repartant."""

const _SEARCH_HOUBLON =  """Ici on en vend que sous forme liquide. 

La bière rousse de Eve est la meilleure, tout le monde en raffole, surtout Rurik. """

const _TEXT_ON_OMELETTE = """Les omelettes aux champignons sont une de nos spécialités, malheureusement nous manquons de champignons en ce moment. 

D’ailleurs Nino, le fermier, en raffole, je ne sais pas comment il va le prendre quand il le saura le pauvre."""
