extends "res://scripts/pnj.gd"

func on_interact() -> void:
	gui.open_dialog(pnj_name, _TEXT).with_options([
		Dialogs.default_search_forbid_fruit_option(self),
		Dialogs.default_search_forbid_fruit_montain_option(self),
		Dialogs.default_search_forbid_fruit_teleport_option(self),
		Dialogs.default_hung_connut_search_charpentier(self),
		Dialogs.default_hung_connut_search_wood(self),
		Dialogs.default_hung_connut_search_houblon(self)
	])

func on_item_drop(item : Item) -> void:
	if item.name == Bag.BiereRousseDeEve :
		gui.open_dialog(pnj_name, """Merci, j'adore la bière de eve.""")
		bag.unloot(Bag.BiereRousseDeEve)
	else : 
		on_item_drop(item)
 
const _TEXT = """Bonjour, 

Je suis le chef de la capitainerie. Aucun bateau ne quitte le port sans ma permission. 
Sans un ordre de mission du capitaine tu ne peux pas quitter l’île."""
