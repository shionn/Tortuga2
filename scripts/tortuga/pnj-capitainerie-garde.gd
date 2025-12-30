extends "res://scripts/pnj.gd"

func on_interact() -> void:
	open_text(pnj_name, _TEXT)
	

const _TEXT = """Hein? Quoi? 

Laisse-moi tranquille, j’ai trop picolé hier soir. Je veux dormir."""


func _on_area_3d_body_entered(body: Node3D) -> void:
	if (player.tags.have(Tags.GUARD_HARBOUR_OFFICE_SOBERING)) :
		_animation.play("idle")
