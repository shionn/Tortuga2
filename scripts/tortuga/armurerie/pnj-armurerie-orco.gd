extends "res://scripts/pnj.gd"

func on_interact() -> void:
	gui.open_dialog_next(Dialog.pnjSay(self, _TEXT)
		.option_search_forbid_fruit()
		.option_search_forbid_fruit_montain()
		.option_search_forbid_fruit_montain_teleport()
		.option_hung_connut_search_charpentier()
		.option_hung_connut_search_wood()
		.option_hung_connut_search_houblon()
		.option_search_wind()
		.option_dialog("Une hache ?", 
			Dialog.playerSay(player, "Je voudrais une hache.")
				.next(Dialog.pnjSay(self, "Ne touche pas à MES haches.")))
		.option_dialog("Une pioche ?",
			Dialog.playerSay(player, "Est-ce que tu as une pioche ?")
				.next(Dialog.pnjSay(self, _TEXT_PICKAXE).on_close(func():tags.add(Tags.ALLOW_PICKAXE))),
			func() : return bag.contain(Bag.ListInvocationVent) and not bag.contain(Bag.Pioche))
		.option_search_cartograph()
	)

const _TEXT = """Bonjour. 
Mon nom est imprononçable pour vous les humains. Vos semblables m'appellent Orco, je suis l'armurier du village. 

Actuellement l'armurerie est fermée, nous ouvrons quand les tambours de guerre résonnent."""

const _TEXT_PICKAXE = """Une pioche ? C’est pas une arme, enfin certain s’en servent comme une arme mais ca vaut pas une hache. 

Ouai j’en ai une qui traine prend la si tu veux."""
