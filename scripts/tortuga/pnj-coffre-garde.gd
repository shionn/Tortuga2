extends "res://scripts/pnj.gd"

const _TEXT_DEFAULT = """Ceci est la réserve d'or. 

Entrée interdite sans l'autorisation du Capitaine!"""

const _TEXT_TRESOR_BARBE_DRUE = """J’enregistre ton dépôt auprès du registre des taxes sur les gains afférents aux affaires de la piraterie.

TODO à revoir"""

func on_interact() -> void:
	open_text(pnj_name, _TEXT_DEFAULT)

func on_item_drop(item : Item) -> void:
	if item.name == 'TresorBarbeDrue' :
		open_text(pnj_name, _TEXT_TRESOR_BARBE_DRUE)
		bag.unloot('TresorBarbeDrue')
		bag.loot('TresorBarbeDrueNet')
	else :
		super.on_item_drop(item)
