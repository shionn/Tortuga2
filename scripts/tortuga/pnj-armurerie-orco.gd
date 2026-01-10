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

const _TEXT = """Bonjour. 

Mon nom est imprononçable pour vous les humains. Vos semblables m'appellent Orco, je suis l'armurier du village. 

Actuellement l'armurerie est fermée, nous ouvrons quand les tambours de guerre résonnent."""
