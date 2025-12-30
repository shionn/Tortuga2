extends "res://scripts/pnj.gd"

func on_interact() -> void:
	gui.open_dialog(pnj_name, """Bonjour aventurier.e. 
	
Prenez place et commandez donc un verre auprès d’une de nos serveuses.""")
