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
		.option_dialog(Dialog.SEARCH_WARRIOR[0],
			Dialog.playerSay(player, Dialog.SEARCH_WARRIOR[1])
				.next(Dialog.pnjSay(self, _TEXT_SEARCH_WARRIOR)),
			Dialog.SEARCH_WARRIOR_CONDITION(self))
		.option_dialog("Kazrog bois beaucoup.", 
			Dialog.playerSay(player, _TEXT_KAZROG_BOIS_TROP)
				.next(Dialog.pnjSay(self, _TEXT_KAZROG_BOIS_TROP_ANSWER).on_close(_go_auberge)),
			func(): return tags.have(Tags.KAZROG_BOIS_TROP_1) and tags.have(Tags.KAZROG_BOIS_TROP_1))
	)

func on_tag_change() -> void:
	visible = not tags.have(Tags.ORCO_AT_AUBERGE)
	
func _go_auberge() -> void : 
	gui.doTransition(func() : tags.add(Tags.ORCO_AT_AUBERGE))

const _TEXT = """Bonjour. 
Mon nom est imprononçable pour vous les humains. Vos semblables m'appellent Orco, je suis l'armurier du village. 

Actuellement l'armurerie est fermée, nous ouvrons quand les tambours de guerre résonnent."""

const _TEXT_PICKAXE = """Une pioche ? C’est pas une arme, enfin certain s’en servent comme une arme mais ca vaut pas une hache. 

Ouai j’en ai une qui traine prend la si tu veux."""

const _TEXT_SEARCH_WARRIOR = "Oui j’aime me battre, et ta proposition est tentante. Mais je dois aussi protéger MES haches ! Et puis whisp m’as promis qu’on va repartir en guerre dans peu de temps."

const _TEXT_KAZROG_BOIS_TROP = "Kazrog est à l'auberge en train d'enchaîner les verres. J’ai essayé de le calmer mais il refuse de me parler, tu devrais peut-être aller le voir."

const _TEXT_KAZROG_BOIS_TROP_ANSWER = "Non d’une hache, si il boit trop il va encore tout casser comme hier soir. Et je sais pourquoi il boit, c'est à cause de sa hache confisquée ici. 
Je vais essayer de le calmer. Ne touchez à rien." 
