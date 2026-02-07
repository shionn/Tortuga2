extends "res://scripts/pnj.gd"

func on_interact() -> void:
	gui.open_dialog_next(Dialog.pnjSay(self, _TEXT)
		.option_search_forbid_fruit(player)
		.option_dialog("Une hache ?", 
			Dialog.playerSay(player, "Je voudrais une hache.")
				.next(Dialog.pnjSay(self, "Ne touche pas à MES haches.")))
	)
	#gui.open_dialog(name,_TEXT).with_options([
	#	Dialogs.default_search_forbid_fruit_option(self),
	#	Dialogs.default_search_forbid_fruit_montain_option(self),
	#	Dialogs.default_search_forbid_fruit_teleport_option(self),
	#	Dialogs.default_hung_connut_search_charpentier(self),
	#	Dialogs.default_hung_connut_search_wood(self),
		#Dialogs.default_hung_connut_search_houblon(self),
		#Dialogs.default_search_wind(self),
		#PnjDialogOption.new(
			#func() : return true,
			#"Je voudrais une hache",
			#func() : gui.open_dialog(name, "Ne touche pas à MES haches.")
		#),
		#PnjDialogOption.new(
			#func() : return bag.contain(Bag.ListInvocationVent) and not bag.contain(Bag.Pioche),
			#"Est-ce que tu as une pioche ?",
			#_on_pickaxe_search
		#)
	#])

func _on_pickaxe_search() -> void:
	gui.open_dialog(pnj_name, _TEXT_PICKAXE)
	tags.add(Tags.ALLOW_PICKAXE)

const _TEXT = """Bonjour. 
Mon nom est imprononçable pour vous les humains. Vos semblables m'appellent Orco, je suis l'armurier du village. 

Actuellement l'armurerie est fermée, nous ouvrons quand les tambours de guerre résonnent."""

const _TEXT_PICKAXE = """Une pioche ? C’est pas une arme, enfin certain s’en servent comme une arme mais ca vaut pas une hache. 

Ouai j’en ai une qui traine prend la si tu veux."""
