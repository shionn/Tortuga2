extends "res://scripts/pnj.gd"

func on_interact() -> void:
	gui.open_dialog(pnj_name, _TEXT).with_options([
		PnjDialogOption.new(
			func() : return tags.have(Tags.SEARCH_WIND),
			"""Y a plus de vent""",
			_on_search_wind
		),
		PnjDialogOption.new(
			func() : return bag.contain(Bag.ListInvocationVent),
			"""Une plume ?""",
			func() : gui.open_dialog(pnj_name, _TEXT_PLUME)
		),
		PnjDialogOption.new(
			func() : return bag.contain(Bag.ListInvocationVent),
			"""Un ossement ?""",
			func() : gui.open_dialog(pnj_name, _TEXT_OSSEMENT)
		),
		PnjDialogOption.new(
			func() : return bag.contain(Bag.ListInvocationVent),
			"""Du sel ?""",
			func() : gui.open_dialog(pnj_name, _TEXT_SEL)
		),
		PnjDialogOption.new(
			func() : return bag.contain(Bag.ListInvocationVent),
			"""Un mojito ?""",
			func() : gui.open_dialog(pnj_name, _TEXT_MOJITO)
		)
	])

func _on_search_wind() :
	gui.open_dialog(pnj_name, _TEXT_SEARCH_WIND)
	bag.loot(Bag.ListInvocationVent)

func on_item_drop(_item : Item) -> void:
	if _item.name == Bag.MojitoSansGlace:
		gui.open_dialog(pnj_name, "C'est quoi ca ? il est chaud ton mojito !")
	else : 
		super.on_item_drop(_item)
		

const _TEXT = """Ben alors mon petit on vient voir Grabouilla, on cherche du réconfort on veut un calinou ? 

Ou alors tu as besoin de moi pour mes puissants pouvoirs ?"""

const _TEXT_SEARCH_WIND = """Hannnn, y a plus de vent ? Et tu voudrais qu’il se lève à nouveau ? Ben c’est facile mon petit. Mais Grabouilla vit recluse sur sa petite île, y a pas tout ce dont j’ai besoin ici.

Il me faut : 
[ul]
Une Plume d’oiseau Géant
Un ossements, si possible un ossement de pirate
Du sel minéral.
Un mojito frais.
[/ul]
Quoi ça fait trop ? Tiens voilà une liste."""

const _TEXT_PLUME = """Oui il me faut une plume, mais pas de n’importe quel oiseau, en plus d’un oiseau géant. Si possible une plume de la poule Dodouce. Cet oiseau très rare aime faire son nid en très haute altitude."""

const _TEXT_OSSEMENT = """Oui un ossement de pirate, une phalange serait parfaite, mais toute autre ossement d’un pirate fera l’affaire."""

const _TEXT_SEL = """Oui du sel, mais pas du sel de mer, j’ai besoin d’un sel minéral provenant de la pierre."""

const _TEXT_MOJITO = """Oui et très frais s’il te plaît, il ne faut pas que les glaçons fondent."""
