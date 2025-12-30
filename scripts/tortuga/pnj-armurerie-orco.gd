extends "res://scripts/pnj.gd"

func on_interact() -> void:
	gui.open_dialog(pnj_name, """Bonjour. 

Mon nom est imprononçable pour vous les humains. Vos semblables m'appellent Orco, je suis l'armurier du village. 

Actuellement l'armurerie est fermée, nous ouvrons quand les tambours de guerre résonnent.""")
