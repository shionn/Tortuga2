extends "res://scripts/pnj.gd"


func on_interact() -> void:
	gui.open_dialogs(pnj_name, """Salut Pirate. 
	
Le Capitaine Whisp est haut il t'attend il a une mission pour toi.""")
