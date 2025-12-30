extends "res://scripts/pnj.gd"

func on_interact() -> void:
	var dialog = gui.open_dialog(pnj_name, _TEXT)
	if player.tags.have(Tags.FORBID_FRUIT_SEARCH_MONTAGNE):
		dialog.set_option("Je veux escalader la montagne", on_search_montain)

func on_search_montain() -> void:
	gui.open_dialog(pnj_name, _TEXT_TELEPORTEUR)
	player.tags.add(Tags.FORBID_FRUIT_SEARCH_TELEPORT)

func on_item_drop(item : Item) -> void:
	if item.name == Bag.PageHungConnutFrag1 or item.name == Bag.PageHungConnutFrag2 or item.name == Bag.PageHungConnutFrag3 :
		player.play_anim_interact()
		if bag.contain(Bag.PageHungConnutFrag1) and bag.contain(Bag.PageHungConnutFrag2) and bag.contain(Bag.PageHungConnutFrag3) :
			play_anim_no()
		else :
			play_anim_yes()
	else :
		super.on_item_drop(item)
	

const _TEXT = """Bonjour aventurier.ère, je suis le cartographe officiel du capitaine Whisp. 

Pas un seul endroit de cette île ne m'est inconnu. Les cartes n’ont aucun secret pour moi."""

const _TEXT_TELEPORTEUR = """Tu veux atteindre le sommet de la plus haute montagne de l’île ? Aucun alpinisme ne le pourrait. Quand j’ai exploré l'île pour en faire une carte complète, j’ai trouvé une pierre étrange dans la forêt au nord. 

En déchiffrant les glyphes gravés dessus, j’ai compris qu’il s’agissait d’un téléporteur qui semble mener au sommet de la montagne. Mais celui-ci a besoin d'une pierre pour être activé, elle serait au fond de la baie, les gardes de la capitainerie l'ont fouillé de fond en comble pour moi mais ils n'ont rien trouvé."""
