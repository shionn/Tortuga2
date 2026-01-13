extends "res://scripts/pnj.gd"

func on_interact() -> void:
	gui.open_dialog(pnj_name, _TEXT).with_options([
		Dialogs.default_search_forbid_fruit_option(self), 
		Dialogs.default_search_forbid_fruit_montain_option(self),
		Dialogs.default_search_forbid_fruit_teleport_option(self),
		Dialogs.default_hung_connut_search_charpentier(self),
		Dialogs.default_hung_connut_search_wood(self), 
		PnjDialogOption.new(
			func(): return tags.have(Tags.HUNG_CONNUT_SEARCH_HOUBLON),
			Dialogs.question_hung_connut_search_houblon,
			func(): gui.open_dialog(pnj_name, _SEARCH_HOUBLON)
		)
	])

func on_item_drop(item : Item) -> void:
	if item.isGold() :
		gui.open_dialog(pnj_name, """Qu’est ce que je vous sers ? """).with_options([
			PnjDialogOption.new(
				func(): return true, 
				"""Bière rousse de Eve""",
				func(): bag.loot(Bag.BiereRousseDeEve)
			),
			PnjDialogOption.new(
				func(): return true, 
				"""Omelette aux champignons""",
				_on_ask_omelette
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

const _SEARCH_HOUBLON =  """Ici on n’en vend que sous forme liquide. 

La bière rousse de eve est la meilleure, tout le monde en raffole, surtout Rurik."""

const _TEXT_ON_OMELETTE = """Les omelettes aux champignons sont une de nos spécialités, malheureusement nous manquons de champignons en ce moment. 

D’ailleurs Nino, le fermier, en raffole, je ne sais pas comment il va le prendre quand il l'apprendra."""
