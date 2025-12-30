extends "res://scripts/pnj.gd"

func on_interact() -> void:
	gui.open_dialog(pnj_name, _TEXT)
	
	
const _TEXT = """Bonjour, 

Je suis le chef de la capitainerie. Aucun bateau ne quitte le port sans ma permission. 
Sans un ordre de mission du capitaine tu ne peux pas quitter l’île."""
