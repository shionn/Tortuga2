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
		.option_search_cartograph()
		.option_dialog(Dialog.SEARCH_BOOK[0], 
			Dialog.playerSay(player, Dialog.SEARCH_BOOK[1])
				.next(Dialog.pnjSay(self, _TEXT_BOOK_1)
					.next(Dialog.pnjSay(self, _TEXT_BOOK_2)
						.next(Dialog.pnjSay(self, _TEXT_BOOK_3)
							.on_close(func(): tags.add(Tags.KNOW_MAYA_BOOK_TRANSFOPAPER))))),
			Dialog.SEARCH_BOOK_CONDITION(self))
	)

const _TEXT = """Qu'est ce que tu me veux ? 

Si tu cherches le menu, il est placardé aux murs."""


const _TEXT_BOOK_1 = """Ho oui ça me parle. j'étais là hier soir avec lui, qu’est ce qu’on a bu. On a enchaîné les cocktails. J’ai commandé une tournée de shooter flambé. 

J’ai parié avec Kerim qu’il n'était pas chiche de les allumer avec sa magie. Il était tellement bourré qu’il a accepté. Il a sorti son livre, puis il a barguigné quelque chose."""

const _TEXT_BOOK_2 = """A cause de l’alcool il a dû se tromper dans son incantation, et il...
[pleure de rire]
Ce con. Il a désintégré les vêtements de Maya. On a eu le droit à un striptease gratuit. Maya était furieuse, elle l’a jeté dehors en lui tapant dessus avec son livre et lui a interdit de remettre les pieds dans l’auberge."""

const _TEXT_BOOK_3 = """[pleure de rire]
Haaa qu’est ce que j’ai bien ris hier soir. Je n'ai pas revu ce livre après."""
