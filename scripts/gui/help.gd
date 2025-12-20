extends MarginContainer

@onready var _text = $Panel/MarginContainer/VBoxContainer/RichTextLabel as RichTextLabel
@onready var _bag = $"../Bag" as Bag

func _on_help_button_pressed() -> void:
	if visible : hide()
	else : 
		_text.clear()
		_text.append_text(_TEXT)
		if _bag.empty() :
			_text.append_text(_BAG_EMPTY_HELP)
		show()

const _TEXT = """Bienvenue dans [color=green]Tortuga 2[/color].

Ce jeu est un [color=green]point and click[/color], vous devrez résoudre des énigmes. 
Cependant à plusieurs moments dans le jeu vous aurez des codes à fournir dans le discord et cela lancera une quête de peinture. 
Une fois cette quête de peinture effectuée, une mise à jour du jeu sera mise à disposition pour aller plus loin dans le jeu. 
Enfin tout cela n’est qu’une supercherie pour nous laisser le temps de créer la suite du jeu. 

Voici les interactions qui sont à votre disposition :
[ul]
Discuter avec les prsonnages
Interagir avec certain objet
Trouver et ramasser des objet
Combiner un objet avec un personnage ou un autre objet
[/ul]

Commandes :
[ul]
Se déplacer avec ZQSD
Sauter avec la touche espace
Interagir avec le clic gauche
Orienter la caméra avec le clic droit
[/ul]

"""
const _BAG_EMPTY_HELP = """Aide de jeu : [color=yellow]Va donc voir whisp, il t'indiquera sûrement ou commencer ta quête.[/color]"""

const _BAG_NOT_EMPTY_HELP = """Aide de jeu : [color=yellow]Si tu ne sais pas quoi faire avec un objet, montre donc cet objet à whisp, il te donnera probablement un indication.[/color]"""
