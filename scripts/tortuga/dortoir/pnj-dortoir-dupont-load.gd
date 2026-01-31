extends "res://scripts/pnj.gd"

const _TEXT = """Je peux recharger votre ancienne partie si vous le souhaitez.
Voulez-vous charger votre partie ?"""

func on_interact() -> void:
	gui.open_yes_no_question("Recharger", _TEXT, _on_no, _on_yes)
	
func _on_no() -> void:
	pass

func _on_yes() -> void:
	bag.load_game()
	player.tags.load_game()
	gui.append_to_console("Partie chargée")

func _process(_delta: float) -> void:
	#if Input.is_action_just_pressed("fast_load") : 
	#	_on_yes()
	pass
