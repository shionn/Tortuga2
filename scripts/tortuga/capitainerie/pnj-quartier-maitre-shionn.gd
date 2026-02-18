extends "res://scripts/pnj.gd"

const quest4_enable = false

func on_interact() -> void:
	gui.open_dialog_next(Dialog.pnjSay(self,_TEXT)
		.option_search_forbid_fruit()
		.option_search_forbid_fruit_montain()
		.option_search_forbid_fruit_montain_teleport()
		.option_hung_connut_search_charpentier()
		.option_hung_connut_search_wood()
		.option_hung_connut_search_houblon()
		.option_search_wind()
		.option_dialog("La barque", 
			Dialog.playerSay(player, "Je souhaiterai utiliser la barque.").next(Dialog.pnjSay(self,_TEXT_SEARCH_BARQUE)
				.on_close(func(): if not bag.contain(Bag.PasseBarque) : tags.add(Tags.SEARCH_PASS))),
			func() : return tags.have(Tags.SEARCH_BARQUE)
		)
		.option_dialog("Le Bateau",
			Dialog.playerSay(player, "J’ai besoin de prendre le bateau pour explorer les îles alentour.")
				.next(Dialog.pnjSay(self,_TEXT_BATEAU)),
			func(): return bag.contain(Bag.ParcheminHungConnut) and not quest4_enable
		)
		.option_dialog("Le Bateau",
			Dialog.playerSay(player, "J’ai besoin de prendre le bateau pour explorer les îles alentour.")
				.next(Dialog.pnjSay(self,_TEXT_BATEAU_1)
					.next(Dialog.pnjSay(self, _TEXT_BATEAU_2)
						.on_close(_start_search_equip))),
			func(): return bag.contain(Bag.ParcheminHungConnut) and quest4_enable
		)
	)

func on_item_drop(item : Item) -> void:
	if item.name == Bag.PasseBarque :
		gui.open_dialog_next(Dialog.pnjSay(self, _TEXT_SHOW_PASS))
	elif item.name == Bag.BiereRousseDeEve :
		if bag.contain(Bag.PasseBarque) :
			gui.open_dialog_next(Dialog.pnjSay(self, _TEXT_BEER_AND_PASS))
			bag.unloot(Bag.PasseBarque)
			bag.loot(Bag.PasseBarqueTanpon)
			tags.remove(Tags.SEARCH_BARQUE)
			tags.remove(Tags.SEARCH_PASS)
		else :
			gui.open_dialog_next(Dialog.pnjSay(self, """Merci, j'adore la bière de eve."""))
		bag.unloot(Bag.BiereRousseDeEve)
	else : 
		super.on_item_drop(item)

func _start_search_equip() -> void :
	if not tags.have(Tags.FOUND_CARTOGRAPH) : tags.add(Tags.FOUND_CARTOGRAPH)
	if not tags.have(Tags.FOUND_ECLAIREUR) : tags.add(Tags.FOUND_ECLAIREUR)
	if not tags.have(Tags.FOUND_NAVIGATEUR) : tags.add(Tags.FOUND_NAVIGATEUR)
	if not tags.have(Tags.FOUND_QUARTIER_MAITRE) : tags.add(Tags.FOUND_QUARTIER_MAITRE)

const _TEXT = """Bonjour, 

Je suis le chef de la capitainerie. Aucun bateau ne quitte le port sans ma permission. 
Sans un ordre de mission du capitaine tu ne peux pas quitter l’île."""

const _TEXT_SEARCH_BARQUE = """Désolé mais sans le pass du capitaine et mon accord tu ne peux pas utiliser une barque."""

const _TEXT_SHOW_PASS = """Moui, c’est bien t’as un pass.

Quoi tu voudrais que je le tamponne ? 

[Touss touss] J’ai soif, oh qu'est ce que j’ai soif, si j’avais eu une bonne bière rousse!."""

const _TEXT_BEER_AND_PASS = """Merci, ça va mieux. 

Au fait, je t’ai tamponné ton pass, tu peux utiliser la barque."""

const _TEXT_BATEAU = """Tu ne peux pas prendre le bateau seul. Il te faut un équipage, il va te falloir du temps pour le rassembler.

Félicitation vous avez accomplis la quête de hung connut. Pour prouver que vous avez fini cette quête reporter le code [color=red]Par ma Voile[/color] en message privé dans discord à Rurick alias Shionn."""

const _TEXT_BATEAU_1 = """Tu ne peux pas prendre le bateau seul. Il te faut un équipage. Malheureusement aucun équipage n'est disponible actuellement. 

Il faut que tu recrutes toi-même ton équipage."""

const _TEXT_BATEAU_2 = """Il te faut : 
[ul]
Un cartographe, quelqu'un de suffisamment compétent pour lire et faire des cartes.
Un navigateur, avec de la bouteille, qui connaît bien ces eaux et ces pièges.
Un éclaireur, pour explorer les îles avant toi et savoir où tu mets les pieds.
Un chef d'équipage, pour tenir tout ce monde et qu'il ne fasse pas de connerie. 
[/ul]"""
