extends "res://scripts/pnj.gd"

func _ready() -> void:
	super._ready()
	_animation.play("sit")

func on_interact() -> void:
	open_text(pnj_name,"""Salut. Tortuga est méconnaissable ce matin. 

Il nous faut comprendre quoi faire, généralement on apprend plein de chose dans la taverne, commence donc par la.

TODO a revoir""")
