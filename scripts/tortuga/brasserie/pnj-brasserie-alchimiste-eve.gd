extends "res://scripts/pnj.gd"

func on_interact() -> void:
	var dialog = gui.open_dialog(pnj_name, _TEXT_PRESENTATION)
	if (player.tags.have(Tags.SEARCH_SOBERING_POTION)) :
		dialog.set_option("Potion de dégrisement ?", on_search_sobering_potion)

func on_search_sobering_potion() -> void:
	if (player.tags.have(Tags.BRASSERIE_HAVE_SOBERING_POTION)) :
		gui.open_dialog(pnj_name, _TEXT_SOBERING_ALREADY_DONE)
	else :
		gui.open_dialog(pnj_name, _TEXT_SEARCH_SOBERING)

func on_item_drop(item : Item) -> void:
	if item.name == Bag.ParcheminBarbeDrue :
		gui.open_dialog(pnj_name, _TEXT_PARCHEMIN_BARBE_DRUE)
		gui.append_to_console("Félicitation, vous avez achevé la première quête. Penser à sauvegarder.")
		player.tags.add(Tags.FORBID_FRUIT_SEARCH)
	elif item.name == Bag.Melon && not player.tags.have(Tags.BRASSERIE_HAVE_SOBERING_POTION) :
		gui.open_dialog(pnj_name,_TEXT_GIVE_MELON)
		$"../caisse-popo-degrissement-vide".visible = false
		$"../caisse-popo-degrisement".visible = true
		player.tags.add(Tags.BRASSERIE_HAVE_SOBERING_POTION)
		bag.unloot(Bag.Melon)
	elif item.name == Bag.FruitDefendu :
		gui.open_dialog(pnj_name, _TEXT_GIVE_FRUIT)
		player.tags.remove(Tags.FORBID_FRUIT_SEARCH)
		player.tags.remove(Tags.FORBID_FRUIT_SEARCH_MONTAGNE)
		player.tags.remove(Tags.FORBID_FRUIT_SEARCH_TELEPORT)
		bag.unloot(Bag.ParcheminBarbeDrue)
		bag.unloot(Bag.FruitDefendu)
		bag.loot(Bag.ParcheminBarbeDrueDecoder)
		pass
	else :
		super.on_item_drop(item)

const _TEXT_PRESENTATION = """Bonjour,

Je suis Eve l'alchimiste de l'île, je sais faire de puissante potion.
Mais je suis surtout connu pour ma bière et mon rhum."""

const _TEXT_PARCHEMIN_BARBE_DRUE = """Salut Compagnon,
Hum ce parchemin n’est pas dans langue étrangère, mais il est codé. Je peux vous le décoder bien sûr mais en échange d’un service.

Une légende raconte qu’il existe un fruit défendu qui pousse sur cette île mais personne ne l’a jamais  trouvé. Il aurait des propriétés curatives importantes et pourrait m’aider à créer des potions plus efficaces. Je n’ai pas plus d’information sur ce fruit.

Quand vous reviendrez avec le fruit, le parchemin sera prêt. Bonne chance!"""

const _TEXT_SEARCH_SOBERING = """Tu veux une potion de dégrisement ?

Oui je peux t’en faire une c’est facile, mais il me manque un melon. Ramène m’en un."""

const _TEXT_SOBERING_ALREADY_DONE = """Tu veux une potion de dégrisement ?

J’en ai de prêtre dans la caisse à côté de toi, sers toi."""

const _TEXT_GIVE_MELON = """Ha, du melon ! Je vais enfin pouvoir finir mes potions de dégrisement.

Bien sûr, sans melon la potion fonctionne très bien. Mais son goût est horrible.

Si tu en veux, sert toi dans la caisse à côté de toi."""

const _TEXT_GIVE_FRUIT = """Salut Compagnon,

Oooh vous êtes génial, vous avez trouvé le fruit défendu? Incroyable je suis tellement heureuse voici le parchemin décrypté.

Je viens juste de le finir, c'est un code très ancien."""
