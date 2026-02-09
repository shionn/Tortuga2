extends "res://scripts/pnj.gd"

func on_interact() -> void:
	gui.open_dialog_next(Dialog.pnjSay(self, _TEXT)
		.option_search_forbid_fruit()
		.option_dialog(Dialog.SEARCH_FORBID_FRUIT_MOUNTAIN[0], 
			Dialog.playerSay(player, Dialog.SEARCH_FORBID_FRUIT_MOUNTAIN[1])
				.next(Dialog.pnjSay(self, _TEXT_SEACH_MONTAIN)),
			Dialog.SEARCH_FORBID_FRUIT_MOUNTAIN_CONDITION(self)
		)
		.option_search_forbid_fruit_montain_teleport()
		.option_dialog(Dialog.SEARCH_CHARPENTIER[0],
			Dialog.playerSay(player, Dialog.SEARCH_CHARPENTIER[1])
				.next(Dialog.pnjSay(self, _TEXT_HUNG_CONNUT_SEARCH_CHARPENTIER_1)
					.next(Dialog.pnjSay(self, _TEXT_HUNG_CONNUT_SEARCH_CHARPENTIER_2)
						.on_close(_on_hung_connut_search_charpentier))),
			Dialog.SEARCH_CHARPENTIER_CONDITION(self)
		)
		.option_dialog(Dialog.SEARCH_WOOD[0],
			Dialog.playerSay(player, Dialog.SEARCH_WOOD[1])
				.next(Dialog.pnjSay(self, _TEXT_SEARCH_WOOD)),
			Dialog.SEARCH_WOOD_CONDITION(self)
		)
		.option_hung_connut_search_houblon()
		.option_search_wind()
	)

func on_item_drop(_item : Item) -> void:
	if _item.name == Bag.BoisDeQualite:
		gui.open_dialog_next(Dialog.pnjSay(self, _TEXT_SHOW_WOOD).on_close(_unlootWood))
	else : 
		super.on_item_drop(_item)
		

func _unlootWood() -> void:
	tags.remove(Tags.HUNG_CONNUT_SEARCH_ESCALTOR)
	tags.remove(Tags.HUNG_CONNUT_SEARCH_CHARPENTIER)
	tags.remove(Tags.HUNG_CONNUT_SEARCH_WOOD)
	tags.remove(Tags.HUNG_CONNUT_SEARCH_HOUBLON)
	tags.remove(Tags.CAN_LOOT_HOUBLON)
	tags.add(Tags.ESCALATOR_CHAMPI_REPAIR)
	bag.unloot(Bag.BoisDeQualite)

#var quest_3_enable = true

func _on_hung_connut_search_charpentier() -> void:
	player.tags.add(Tags.HUNG_CONNUT_SEARCH_WOOD)
	player.tags.remove(Tags.HUNG_CONNUT_SEARCH_CHARPENTIER)
	player.tags.remove(Tags.HUNG_CONNUT_SEARCH_ESCALTOR)


const _TEXT = """Bonjour, je m’appelle Ryland. 

Je suis charpentier. Toutes les constructions du village sont mon œuvre. Et de temps en temps je construis des trucs pour permettre d'explorer plus loin. D'ailleurs ma dernière construction est juste derrière la montagne en face de moi.
"""

const _TEXT_SEACH_MONTAIN = """Franchement moi je ne l'escaladerai pas, mais je construirais une structure pour atteindre le sommet. 

Enfin la montagne dont tu parle est tellement grande qu’il me faudrait peut être une vie entière pour y arriver. """

const _TEXT_HUNG_CONNUT_SEARCH_CHARPENTIER = """Quoi ? L’escalator du nord est détruit ? C'est une catastrophe ! Nous ne pouvons atteindre le sommet de la montagne ! On y trouve les meilleurs champignons.

Je vais le réparer mais il me faut du temps. Reviens dans quelque temps ca sera fait. 

Pour avancer plus loin, il nous faut accomplir une quête de peinture.
Pour prouvez que vous avez fini cette quête reporter le code \"Par Bois et Clou\" en message privé dans discord à Rurick alias Shionn."""

const _TEXT_HUNG_CONNUT_SEARCH_CHARPENTIER_1 = """Quoi ? L’escalator du nord est détruit ? C'est une catastrophe ! nous ne pouvons atteindre le sommet de la montagne ! On y trouve les meilleurs champignons.

Je vais le réparer mais il me faut des matériaux. Notamment du bois. Mais le bois de qualité se trouve en montagne. Le bois des palmiers n’est pas adapté pour ce type de construction."""

const _TEXT_HUNG_CONNUT_SEARCH_CHARPENTIER_2 = """Donc pour aller chercher du bois il nous faut l’escalator, qui est cassé et pour le réparer il nous faut du bois. 

Il faut aller chercher le bois en dehors de l’île. Ramène m’en !"""

const _TEXT_SEARCH_WOOD = """Je t’ai dit que le bois de qualité pousse en montagne, mais l’escalator est cassé donc on ne peut pas aller chercher du bois. 

Il faut aller chercher le bois en dehors de l’île. Ramène m’en et je pourrai réparer l’escalator."""

const _TEXT_SHOW_WOOD = """Où as-tu trouvé ce bois ? 
Peu importe, ce qui compte c’est qu’on ai du bois de qualité, je vais pouvoir reconstruire l’escalator. 

Rejoins moi au pied de l’escalator et je commence les travaux."""
