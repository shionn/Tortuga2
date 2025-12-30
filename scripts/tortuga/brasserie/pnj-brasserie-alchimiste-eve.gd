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
		# a decommanté pour lancer la quete numero 2
		#player.tags.add(Tags.FORBID_FRUIT_SEARCH)
		player.play_anim_interact()
	elif item.name == Bag.Melon && not player.tags.have(Tags.BRASSERIE_HAVE_SOBERING_POTION) :
		gui.open_dialog(pnj_name,_TEXT_GIVE_MELON)
		$"../caisse-popo-degrissement-vide".visible = false
		$"../caisse-popo-degrisement".visible = true
		player.tags.add(Tags.BRASSERIE_HAVE_SOBERING_POTION)
		player.play_anim_interact()
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

const _TEXT_PARCHEMIN_BARBE_DRUE = """Hum ce parchemin n’est pas dans langue étrangère, mais il est codé, je peux te le décoder mais je ne peux pas encore le faire. 
	
Pour avancer plus loin, il nous faut accomplir une quête de peinture. 
Pour prouvez que vous avez fini cette quête reporter le code \"Par ma barbe rousse et drue\" dans le canal discord des quêtes. 
Cela permettra de lancer la quête de peinture qui débloquerait la suite."""

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
