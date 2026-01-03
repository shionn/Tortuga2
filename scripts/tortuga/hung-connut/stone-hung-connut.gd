extends "res://scripts/interactable.gd"

func on_interact() -> void:
	gui.open_dialog("Marbre de Hung Connut", _TEXT)
	player.tags.add(Tags.HUNG_CONNUT_SEARCH_ESCALTOR)


func _on_area_3d_body_entered(body: Node3D) -> void:
	visible = bag.contain(Bag.CarteHungConnut) or player.tags.have(Tags.HUNG_CONNUT_TEASUR_OPENED)
		

const _TEXT = """Là où le vent souffle très fort,
tu devra monter,
car pour approcher mon trésor
il te faudra le mériter!
Au Nord de l'île,
d’un pas habile et hâté, 
trouve le panneau mobile,
car il va te mener,
là où autrement tu ne saurais aller!"""
