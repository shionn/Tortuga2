extends "res://scripts/interactable.gd"

@onready var _bag = $"/root/World/Gui/Bag" as Bag

const _TEXT =  """Vous avez résolue l'énigme de Barbe Drue

Dans ce coffre en plus t'as amas d'or, et de rubis vous trouverez également un parchemin,
Mais de texte anciens n'étant pas un érudit,
De ce que vous lisez vous n'y comprenez rien,
Peut être qu'au village,
Pour le déchiffrer vous trouverez un sage."""

func on_interact() -> void:
	# 
	if _bag.contain('TresorBarbeDrue') or  _bag.contain('TresorBarbeDrueNet') : 
		open_alert("Coffre vide", "Le coffre est vide")
	else :
		open_question("Entrez le code", on_answer)

func on_answer(answer: String) -> void:
	if answer == "14738":
		open_dialog_and_img("Félicitation", _TEXT, load("res://assets/imgs/treasures.png"))
		_bag.loot('TresorBarbeDrue')
		_bag.loot('ParcheminBarbeDrue')
	else :
		open_alert("Mauvais code", "Le coffre ne s'ouvre pas.")
