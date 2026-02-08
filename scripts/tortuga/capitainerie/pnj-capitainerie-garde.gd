extends "res://scripts/pnj.gd"

func on_interact() -> void:
	if (tags.have(Tags.GUARD_HARBOUR_OFFICE_SOBERING)) :
		gui.open_dialog_next(Dialog.pnjSay(self, _TEXT_SOBRE)
			.option_search_forbid_fruit()
			.option_search_forbid_fruit_montain()
			.option_dialog(Dialog.SEARCH_TELEPORT_CRYSTAL[0], 
				Dialog.playerSay(player, Dialog.SEARCH_TELEPORT_CRYSTAL[1])
					.next(Dialog.pnjSay(self,_TEXT_INDICE_CRYSTAL)),
				Dialog.SEARCH_TELEPORT_CRYSTAL_CONDITION(self)
			)
			.option_hung_connut_search_charpentier()
			.option_hung_connut_search_wood()
			.option_hung_connut_search_houblon()
			.option_search_wind()
		)
	else :
		gui.open_dialog_next(Dialog.pnjSay(self, _TEXT)
			.on_close(func():tags.add(Tags.SEARCH_SOBERING_POTION)))
		

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

func on_tag_change() -> void:
	if (tags.have(Tags.GUARD_HARBOUR_OFFICE_SOBERING)) :
		animation_name = "idle"
		_animation.play("idle")

const _TEXT = """Hein? Quoi? 

Laisse-moi tranquille, j’ai trop picolé hier soir. Je veux dormir."""

const _TEXT_SOBRE = """Super ! J’ai plus mal à la tête. Merci de m’avoir dégrisé."""

const _TEXT_INDICE_CRYSTAL = """Tu cherches le cristal de téléportation ? Je me souviens de cette histoire. 
Zakari nous a fait chercher ce cristal dans toute la baie, encore et encore, nous n’avons rien trouvé. Mais tu sais avec le courant elle a pu s'échouer n’importe où ! Regarde le nombre de bouteilles qu’on retrouve sans arrêt ! Va savoir si ça se trouve le cristal est sous mes pieds."""
