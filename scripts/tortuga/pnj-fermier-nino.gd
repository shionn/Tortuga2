extends "res://scripts/pnj.gd"


func on_interact() -> void:
	var dialog = gui.open_dialog(pnj_name, _TEXT)
	if player.tags.have(Tags.CHERCHE_FRUIT_DEFENDU):
		dialog.set_option("Je cherche le Fruit Défendu", on_search_fruit)

func on_search_fruit() -> void:
	gui.open_dialog(pnj_name, _TEXT_SEARCH_FRUIT, Vector2(400,500))
	player.tags.add(Tags.CHERCHE_FRUIT_DEFENDU_2)

const _TEXT = """Bonjour aventurier.ère, je suis le seul jardinier de l’île. Ne marche pas dans mes cultures. Si vous abîmez mes cultures, nous n’aurons plus de houblon pour que Eve puisse en faire de la bonne bière !

Et si il n’y a plus de bière, nous courons vers une mutinerie certaine. 

J’ai de nombreuses autres connaissances en botanique. Mais avoir du bon houblon pour de la bonne bière est une priorité absolue."""

const _TEXT_SEARCH_FRUIT = """Ah oui le fruit défendu. 
Tous les amoureux des plantes la connaissent celle là elle se transmet de père en fils. Mais ce n’est qu’une légende car personne n’a jamais trouvé l’arbre qui porte ce fruit. On dit que sur le mont le plus haut au-delà des nuages pousse un arbre unique en son genre, il ne fait qu’un fruit par an, le fruit défendu. Il pousse dans un lieu inaccessible pour nous mortels et de fait son fruit serait défendu, il aurait des propriétés curatives très puissantes. 

Mais ce n'est qu'une légende n’est ce pas? Qui pourrait aller dans les monts plus hauts et inaccessibles? Il faudrait pouvoir voler ou avoir un véhicule pour nous y emmener. Peut-être le cartographe aurait une idée sur quel lieu serait celui de la Légende.
"""
