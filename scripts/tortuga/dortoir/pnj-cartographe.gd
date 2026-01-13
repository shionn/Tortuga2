extends "res://scripts/pnj.gd"

func on_interact() -> void:
	gui.open_dialog(pnj_name, _TEXT).with_options([
		Dialogs.default_search_forbid_fruit_option(self),
		PnjDialogOption.new(
			func (): return player.tags.have(Tags.FORBID_FRUIT_SEARCH_MONTAGNE),
			Dialogs.question_search_forbid_fruit_montagn,
			on_search_montain
		),
		PnjDialogOption.new(
			func (): return player.tags.have(Tags.FORBID_FRUIT_SEARCH_TELEPORT),
			Dialogs.question_search_forbid_fruit_teleport,
			func (): gui.open_dialog(pnj_name, _TEXT_PIERRE_TELEPORTEUR)
		),
		Dialogs.default_search_forbid_fruit_teleport_option(self),
		Dialogs.default_hung_connut_search_charpentier(self),
		Dialogs.default_hung_connut_search_wood(self),
		Dialogs.default_hung_connut_search_houblon(self)
	])

func on_search_montain() -> void:
	gui.open_dialog(pnj_name, _TEXT_TELEPORTEUR)
	if not bag.contain(Bag.CrystalTeleportationOasis) :
		player.tags.add(Tags.FORBID_FRUIT_SEARCH_TELEPORT)

func on_item_drop(item : Item) -> void:
	if item.name == Bag.PageHungConnutFrag1 or item.name == Bag.PageHungConnutFrag2 or item.name == Bag.PageHungConnutFrag3 :
		if bag.contain(Bag.PageHungConnutFrag1) and bag.contain(Bag.PageHungConnutFrag2) and bag.contain(Bag.PageHungConnutFrag3) :
			play_anim_interact()
			gui.open_dialog(pnj_name, TEXT_FRAGMENT_HUNG_COMPLET)
			bag.unloot(Bag.PageHungConnutFrag1)
			bag.unloot(Bag.PageHungConnutFrag2)
			bag.unloot(Bag.PageHungConnutFrag3)
			bag.loot(Bag.CarteHungConnut)
		else :
			play_anim_no()
			gui.open_dialog(pnj_name, _TEXT_MISSING_PAGE)
	elif item.name == Bag.CrystalTeleportationOasis :
		gui.open_dialog(pnj_name, _TEXT_CRISTAL_TP)
	else :
		super.on_item_drop(item)


const _TEXT = """Bonjour aventurier.ère, je suis le cartographe officiel du capitaine Whisp.

Pas un seul endroit de cette île ne m'est inconnu. Les cartes n’ont aucun secret pour moi."""

const _TEXT_TELEPORTEUR = """Tu veux atteindre le sommet de la plus haute montagne de l’île ? Aucun alpinisme ne le pourrait. Quand j’ai exploré l'île pour en faire une carte complète, j’ai trouvé une pierre étrange dans la forêt au nord.

En déchiffrant les glyphes gravés dessus, j’ai compris qu’il s’agissait d’un téléporteur qui semble mener au sommet de la montagne. Mais celui-ci a besoin d'un cristal pour être activé, il serait au fond de la baie, les gardes de la capitainerie l'ont fouillé de fond en comble pour moi mais ils n'ont rien trouvé."""

const _TEXT_PIERRE_TELEPORTEUR = """Moi aussi j'aimerai bien le trouver. 

Comme ça je pourrai enfin activer le téléporteur et accéder au sommet de la montagne."""

const _TEXT_MISSING_PAGE = """Que veux tu que je fasse de cela?
Il manque des pages pour que je puisse en faire une carte complète.

Il devrait y avoir trois fragments."""

const TEXT_FRAGMENT_HUNG_COMPLET = """Ça va être de la tarte. 

Regarde suffit de superposer les fragments et de regarder à travers à la lumière du jour...

Tiens voilà une carte complète."""

const _TEXT_CRISTAL_TP = """Ho bravo tu as réussi à trouvé ce cristal. Les gardes ne sont vraiment pas doués. 

Qu’attend tu pour aller l’essayer sur la pierre dans la forêt au nord ?"""
