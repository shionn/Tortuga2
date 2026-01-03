extends "res://scripts/pnj.gd"



func on_interact() -> void:
	gui.open_dialog(pnj_name, _TEXT).with_options([
		_search_fruit_option, 
		Dialogs.default_search_forbid_fruit_montain_option(self),
		Dialogs.default_search_forbid_fruit_teleport_option(self),
		Dialogs.default_hung_connut_search_charpentier(self)
	])

func on_item_drop(item : Item) -> void:
	if item.name == Bag.FruitDefendu :
		gui.open_dialog(pnj_name, _TEXT_FORBID_FRUIT)
		
	
var _search_fruit_option = PnjDialogOption.new(
	func (): return player.tags.have(Tags.FORBID_FRUIT_SEARCH),
	Dialogs.question_search_forbid_fruit,
	_on_search_fruit
)

func _on_search_fruit() -> void:
	gui.open_dialog(pnj_name, _TEXT_SEARCH_FRUIT, Vector2(400,500))
	if not player.tags.have(Tags.FORBID_FRUIT_LOOTED) :
		player.tags.add(Tags.FORBID_FRUIT_SEARCH_MONTAGNE)

const _TEXT = """Bonjour aventurier.ère, je suis le seul jardinier de l’île. Ne marche pas dans mes cultures. Si vous abîmez mes cultures, nous n’aurons plus de houblon pour que Eve puisse en faire de la bonne bière !

Et si il n’y a plus de bière, nous courons vers une mutinerie certaine. 

J’ai de nombreuses autres connaissances en botanique. Mais avoir du bon houblon pour de la bonne bière est une priorité absolue."""

const _TEXT_SEARCH_FRUIT = """Ah oui le fruit défendu. 

Tous les amoureux des plantes la connaissent cette légende. Elle se transmet de père en fils. Mais ce n’est qu’une légende car personne n’a jamais trouvé l’arbre qui porte ce fruit. On dit que sur le mont le plus haut au-delà des nuages pousse un arbre unique en son genre, il ne fait qu’un fruit par an, le fruit défendu. Il pousse dans un lieu inaccessible pour nous mortels et de fait son fruit serait défendu, il aurait des propriétés curatives très puissantes. 

Mais ce n'est qu'une légende n’est ce pas? Qui pourrait aller dans les monts plus hauts et inaccessibles? Il faudrait pouvoir voler ou avoir un véhicule pour nous y emmener. Peut-être que le cartographe aurait une idée..."""

const _TEXT_FORBID_FRUIT = """Ho tu as réussi à obtenir le fruit défendu. La légende était donc vraie. Que vas-tu en faire ?"""
