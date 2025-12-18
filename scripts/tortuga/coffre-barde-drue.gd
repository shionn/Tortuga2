extends "res://scripts/interactable.gd"

@onready var _bag = $"/root/World/Gui/Bag" as Bag
@onready var _item_tresor = $"/root/World/Gui/Items/TresorBarbeDrue" as Item
@onready var _item_parchemin = $"/root/World/Gui/Items/ParcheminBarbeDrue" as Item

const _TEXT =  """Vous avez résolue l'énigme de Barbe Drue

Dans ce coffre en plus t'as amas d'or, et de rubis vous trouverez également un parchemin,
Mais de texte anciens n'étant pas un érudit,
De ce que vous lisez vous n'y comprenez rien,
Peut être qu'au village,
Pour le déchiffrer vous trouverez un sage.

Pour prouvez que vous avez fini cette quête reporter le code \"Par ma barbe rousse et drue\" dans le canal discord des quêtes."""

func on_interact() -> void:
	open_question("Entrez le code", on_answer)

func on_answer(answer: String) -> void:
	if answer == "14738":
		open_dialog_and_img("Félicitation", _TEXT, load("res://assets/imgs/treasures.png"))
		_bag.loot(_item_tresor)
		_bag.loot(_item_parchemin)
	else :
		open_alert("Mauvais code", "Le coffre ne s'ouvre pas.")
