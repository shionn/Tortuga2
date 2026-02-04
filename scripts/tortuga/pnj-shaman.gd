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
	if _item.name == Bag.ListInvocationVent:
		gui.open_dialog(pnj_name, "C’est ma propre liste que veux tu que j’en fasse ? Rapporte moi donc plutôt les ingrédients.")
	elif _item.name == Bag.Plume or _item.name == Bag.Ossement or _item.name == Bag.SelDeMontagne :
		gui.open_dialog(pnj_name, "Bravo, tu as trouvé certains ingrédients, mais je veux d'abords mon Mojito.")
	elif _item.name == Bag.Mojito :
		bag.unloot(Bag.Mojito)
		if bag.contain(Bag.Plume) and  bag.contain(Bag.Ossement) and  bag.contain(Bag.SelDeMontagne) :
			tags.remove(Tags.SEARCH_WIND)
			tags.add(Tags.WIND_BLOWING)
			bag.unloot(Bag.Plume)
			bag.unloot(Bag.ListInvocationVent)
			bag.unloot(Bag.Ossement)
			bag.unloot(Bag.SelDeMontagne)
			gui.open_dialog(pnj_name, _TEXT_MOJITO_ALL)
		else :
			gui.open_dialog(pnj_name, _TEXT_MOJITO_MISSING)
	elif _item.name == Bag.MojitoSansGlace:
		gui.open_dialog(pnj_name, "C'est quoi ca ? il est chaud ton Mojito !")
		bag.unloot(Bag.MojitoSansGlace)
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

const _TEXT_MOJITO_MISSING = """Merci pour le Mojito, j’avais soif.
[gloup gloups]
Ha mais je vois qu’il te manque encore des ingrédients pour l’invocation. Reviens me voir avec tous les ingrédients. 
[gloop gloups]
Et un autre Mojito !"""

const _TEXT_MOJITO_ALL = """Merci pour le mojito, j’avais soif.
[gloup gloups]
Je récupère aussi tout ce qu’il faut pour l’invocation. 
[gloup gloups]
J’ai besoin d’être seul pour l’invocation, à ton retour sur l'île le vent soufflera de nouveau."""
