extends "res://scripts/pnj.gd"


func on_interact() -> void:
	gui.open_dialog(pnj_name, """Salut Pirate. 
	
Le Capitaine Whisp est en haut, il t'attend. Il a une mission pour toi.""")
