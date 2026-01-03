extends "res://scripts/pnj.gd"

func on_interact() -> void:
	gui.open_dialog(pnj_name,_TEXT).with_options([
		Dialogs.default_search_forbid_fruit_option(self), 
		Dialogs.default_search_forbid_fruit_montain_option(self),
		Dialogs.default_search_forbid_fruit_teleport_option(self),
		Dialogs.default_hung_connut_search_charpentier(self)
	])

const _TEXT = """Qu'est ce que tu me veux ? 

Si tu cherches le menu, il est placardé aux murs."""
