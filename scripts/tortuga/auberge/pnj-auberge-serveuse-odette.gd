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
		gui.open_dialog(pnj_name, """Qu’est ce que je vous sers ? """).with_options([
			PnjDialogOption.new(
				func(): return not bag.contain(Bag.BiereRousseDeEve), 
				"""Bière rousse de Eve""",
				func(): bag.loot(Bag.BiereRousseDeEve)
			),
			PnjDialogOption.new(
				func(): return true, 
				"""Omelette aux champignons""",
				_on_ask_omelette
			),
			PnjDialogOption.new(
				func(): return true,
				"Je voudrais un cocktail",
				func(): gui.open_alert(pnj_name, """C'est Maya la spécialiste en cocktail""")
			)
		])
	else : 
		super.on_item_drop(item)

func _on_ask_omelette() -> void :
	tags.add(Tags.KNOW_FERMIER_LOVE_OMELETTE)
	gui.open_dialog(pnj_name, _TEXT_ON_OMELETTE)

const _TEXT = """Bonjour qu'est ce que je vous sert? 
Les clients sont négligents, ils oublient souvent des choses sur les tables. 

N'oubliez rien en repartant."""

const _SEARCH_HOUBLON =  """Ici on en vend que sous forme liquide. 

La bière rousse de Eve est la meilleure, tout le monde en raffole, surtout Rurik. """

const _TEXT_ON_OMELETTE = """Les omelettes aux champignons sont une de nos spécialités, malheureusement nous manquons de champignons en ce moment. 

D’ailleurs Nino, le fermier, en raffole, je ne sais pas comment il va le prendre quand il le saura le pauvre."""
