extends MarginContainer

@onready var _text = $Panel/MarginContainer/VBoxContainer/RichTextLabel as RichTextLabel

func _on_help_button_pressed() -> void:
	if visible : hide()
	else : 
		_text.clear()
		_text.append_text(_TEXT)
		show()

const _TEXT = """Bienvenue dans [b]Tortuga 2[/b].

Ce jeu est J’arrive pas écrire la suite 

Je dois indiquer les différente possibilité d’interaction en jeu

"""
