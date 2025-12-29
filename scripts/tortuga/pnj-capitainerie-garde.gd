extends "res://scripts/pnj.gd"

func on_interact() -> void:
	open_text(pnj_name, _TEXT)

const _TEXT = """Hein? Quoi? 

Laisse-moi tranquille, j’ai trop picolé hier soir. Je veux dormir."""
