extends "res://scripts/pnj.gd"

func on_interact() -> void:
	if (player.tags.have(Tags.GUARD_HARBOUR_OFFICE_SOBERING)) :
		gui.open_dialog(pnj_name, _TEXT_SOBRE).with_options([
			Dialogs.default_search_forbid_fruit_option(self),
			Dialogs.default_search_forbid_fruit_montain_option(self),
			PnjDialogOption.new(
				func () : return player.tags.have(Tags.FORBID_FRUIT_SEARCH_TELEPORT),
				Dialogs.question_search_forbid_fruit_teleport,
				func () : gui.open_dialog(pnj_name, _TEXT_INDICE_CRYSTAL)
			),
			Dialogs.default_hung_connut_search_charpentier(self)
		])
	else :
		gui.open_dialog(pnj_name, _TEXT)
		if player.tags.have(Tags.FORBID_FRUIT_SEARCH_TELEPORT) :
			player.tags.add(Tags.SEARCH_SOBERING_POTION)

func on_item_drop(item : Item) -> void:
	if (item.name == Bag.PotionDegrisement and not player.tags.have(Tags.GUARD_HARBOUR_OFFICE_SOBERING)) :
		bag.unloot(Bag.PotionDegrisement)
		player.tags.add(Tags.GUARD_HARBOUR_OFFICE_SOBERING)
		player.tags.remove(Tags.SEARCH_SOBERING_POTION)
		animation_name = "idle"
		play_anim_yes()
		on_interact()
	else :
		super.on_item_drop(item)

func _on_area_3d_body_entered(body: Node3D) -> void:
	if (player.tags.have(Tags.GUARD_HARBOUR_OFFICE_SOBERING)) :
		animation_name = "idle"
		_animation.play("idle")

const _TEXT = """Hein? Quoi? 

Laisse-moi tranquille, j’ai trop picolé hier soir. Je veux dormir."""

const _TEXT_SOBRE = """Super ! J’ai plus mal à la tête. Merci de m’avoir dégrisé."""

const _TEXT_INDICE_CRYSTAL = """Tu cherches le cristal de téléportation ? Je me souviens de cette histoire. 

Zakari nous a fait chercher ce cristal dans toute la baie, encore et encore, nous n’avons rien trouvé. Mais tu sais avec le courant elle a pu s'échouer n’importe où ! Regarde le nombre de bouteilles qu’on retrouve sans arrêt ! Va savoir si ça se trouve le cristal est sous mes pieds."""
