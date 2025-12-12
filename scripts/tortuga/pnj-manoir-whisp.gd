extends "res://scripts/pnj.gd"

func _init() -> void:
	_pnj_name = "Whisp"
	_pnj_dialog = """Salut. Tortuga est méconnaissable ce matin. 

Il nous faut comprendre quoi faire, généralement on apprend plein de chose dans la taverne, commence donc par la.

TODO a revoir"""

func _ready() -> void:
	super._ready()
	#_animation.get_animation("idle").loop_mode = Animation.LOOP_LINEAR
	_animation.play("sit")
	
