extends "res://scripts/pnj.gd"

func on_interact() -> void:
	gui.open_dialog(pnj_name, _TEXT).with_options([
		Dialogs.default_search_forbid_fruit_option(self),
		Dialogs.default_search_forbid_fruit_montain_option(self),
		Dialogs.default_search_forbid_fruit_teleport_option(self),
		Dialogs.default_hung_connut_search_charpentier(self),
		Dialogs.default_hung_connut_search_wood(self),
		Dialogs.default_hung_connut_search_houblon(self),
		Dialogs.default_search_wind(self),
		PnjDialogOption.new(
			func() : return tags.have(Tags.SEARCH_BARQUE),
			"Je veux utiliser une barque",
			_on_search_barque
		)
	])

func on_item_drop(item : Item) -> void:
	if item.name == Bag.PasseBarque :
		gui.open_dialog(pnj_name, _TEXT_SHOW_PASS)
	elif item.name == Bag.BiereRousseDeEve :
		if bag.contain(Bag.PasseBarque) :
			gui.open_dialog(pnj_name, _TEXT_BEER_AND_PASS)
			bag.unloot(Bag.PasseBarque)
			bag.loot(Bag.PasseBarqueTanpon)
			tags.remove(Tags.SEARCH_BARQUE)
			tags.remove(Tags.SEARCH_PASS)
		else :
			gui.open_dialog(pnj_name, """Merci, j'adore la bière de eve.""")
		bag.unloot(Bag.BiereRousseDeEve)
	else : 
		on_item_drop(item)
 
func _on_search_barque() : 
	gui.open_dialog(pnj_name,_TEXT_SEARCH_BARQUE)
	if not bag.contain(Bag.PasseBarque) : tags.add(Tags.SEARCH_PASS)

const _TEXT = """Bonjour, 

Je suis le chef de la capitainerie. Aucun bateau ne quitte le port sans ma permission. 
Sans un ordre de mission du capitaine tu ne peux pas quitter l’île."""

const _TEXT_SEARCH_BARQUE = """Désolé mais sans le pass du capitaine et mon accord tu ne peux pas utiliser une barque."""

const _TEXT_SHOW_PASS = """Moui, c’est bien t’as un pass.

Quoi tu voudrais que je le tamponne ? 

Touss touss j’ai soif oh qu'est ce que j’ai soif. """

const _TEXT_BEER_AND_PASS = """Merci, ça va mieux. 

Au fait, je t’ai tamponné ton pass, tu peux utiliser la barque. """
