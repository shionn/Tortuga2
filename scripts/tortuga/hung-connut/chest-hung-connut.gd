extends "res://scripts/props/chest.gd"


func on_interact() -> void:
	if _open:
		close()
	else: open()
