extends "res://scripts/pnj.gd"

func on_interact() -> void:
	gui.open_dialog_next(Dialog.pnjSay(self, _TEXT_PRESENTATION)
		.option_search_forbid_fruit_montain()
		.option_search_forbid_fruit_montain_teleport()
		.option_hung_connut_search_charpentier()
		.option_hung_connut_search_wood()
		.option_dialog(Dialog.SEARCH_HOUBLON[0], 
			Dialog.playerSay(player, Dialog.SEARCH_HOUBLON[1])
				.next(Dialog.pnjSay(self,_SEARCH_HOUBLON)),
			func(): return tags.have(Tags.HUNG_CONNUT_SEARCH_HOUBLON) and not bag.contain(Bag.Houblon)
		)
		.option_dialog("Potion de dégrisement", 
			Dialog.playerSay(player, "Je cherche une potion de dégrisement")
				.next(Dialog.pnjSay(self, _TEXT_SEARCH_SOBERING)),
			func(): return tags.have(Tags.SEARCH_SOBERING_POTION) and not tags.have(Tags.BRASSERIE_HAVE_SOBERING_POTION)
		)
		.option_dialog("Potion de dégrisement", 
			Dialog.playerSay(player, "Je cherche une potion de dégrisement")
				.next(Dialog.pnjSay(self, _TEXT_SOBERING_ALREADY_DONE)),
			func(): return tags.have(Tags.SEARCH_SOBERING_POTION) and tags.have(Tags.BRASSERIE_HAVE_SOBERING_POTION)
		)
	)

func on_item_drop(item : Item) -> void:
	if item.name == Bag.ParcheminBarbeDrue :
		gui.open_dialog_next(Dialog.playerSay(player, _TEXT_ASK_PARCHEMIN_TRADUCTION)
			.next(Dialog.pnjSay(self, _TEXT_PARCHEMIN_BARBE_DRUE)
				.next(Dialog.pnjSay(self, _TEXT_PARCHEMIN_BARBE_DRUE_2)
					.on_close(func() : tags.add(Tags.FORBID_FRUIT_SEARCH))))
		)
	elif item.name == Bag.Melon && not player.tags.have(Tags.BRASSERIE_HAVE_SOBERING_POTION) :
		bag.unloot(Bag.Melon)
		gui.open_dialog_next(Dialog.pnjSay(self, _TEXT_GIVE_MELON)
			.on_close(func(): tags.add(Tags.BRASSERIE_HAVE_SOBERING_POTION)))
	elif item.name == Bag.FruitDefendu :
		gui.open_dialog_next(Dialog.playerSay(player, _TEXT_PLAYER_SHOW_FRUIT)
			.next(Dialog.pnjSay(self, _TEXT_GIVE_FRUIT).on_close(_on_give_fruit))
		)
	else :
		super.on_item_drop(item)

func _on_give_fruit() -> void :
	tags.remove(Tags.FORBID_FRUIT_SEARCH)
	tags.remove(Tags.FORBID_FRUIT_SEARCH_MONTAGNE)
	tags.remove(Tags.FORBID_FRUIT_SEARCH_TELEPORT)
	bag.unloot(Bag.ParcheminBarbeDrue)
	bag.unloot(Bag.FruitDefendu)
	bag.loot(Bag.ParcheminBarbeDrueDecoder)
	play_anim_interact()


const _TEXT_PRESENTATION = """Bonjour,

Je suis Eve l'alchimiste de l'île, je sais faire de puissantes potions.
Mais je suis surtout connu pour ma bière et mon rhum."""

const _TEXT_ASK_PARCHEMIN_TRADUCTION = """Bonjour Eve, 
Pourriez vous me traduire ce parchemin ?"""

const _TEXT_PARCHEMIN_BARBE_DRUE = """Hum ce parchemin n’est pas dans une langue étrangère, mais il est codé. Je peux vous le décoder bien sûr mais en échange d’un service."""

const _TEXT_PARCHEMIN_BARBE_DRUE_2 = """Une légende raconte qu’il existe un [color=red]fruit défendu[/color] qui pousse sur cette île mais personne ne l’a jamais trouvé. Il aurait des propriétés curatives importantes et pourrait m’aider à créer des potions plus efficaces. Je n’ai pas plus d’information sur ce fruit.

Quand vous reviendrez avec le fruit, le parchemin sera prêt. Bonne chance !"""

const _TEXT_SEARCH_SOBERING = """Tu veux une potion de dégrisement ?

Oui je peux t’en faire une c’est facile, mais il me manque un melon. Ramène m’en un."""

const _TEXT_SOBERING_ALREADY_DONE = """Tu veux une potion de dégrisement ?

J’en ai de prêtre dans la caisse à côté de toi, sers toi."""

const _TEXT_GIVE_MELON = """Ha, du melon ! Je vais enfin pouvoir finir mes potions de dégrisement.
Bien sûr, sans melon la potion fonctionne très bien. Mais son goût est horrible.

Si tu en veux, sert toi dans la caisse à côté de toi."""

const _TEXT_PLAYER_SHOW_FRUIT = """Bonjour Eve, 

Je vous rapporte le fruit défendu."""

const _TEXT_GIVE_FRUIT = """Oooh vous êtes génial, vous avez trouvé le fruit défendu ? Incroyable je suis tellement heureuse voici le parchemin décrypté.

Je viens juste de le finir, c'est un code très ancien."""

const _SEARCH_HOUBLON = """Ben c’est drôle ça. Si tu veux ma bière rousse y en a à l'auberge contre quelque pièces il t’en vendrons. 

C’est grâce au houblon de Nino que je peux faire une si bonne bière. """
