extends "res://scripts/pnj.gd"

func on_interact() -> void:
	gui.open_dialog(pnj_name, _TEXT_1).with_options([PnjDialogOption.new(
		func() : return true,
		"Pourquoi tu ne travail plus pour Whisp ?",
		func(): gui.open_dialog(pnj_name, _TEXT_2).with_options([PnjDialogOption.new(
			func(): return bag.contain(Bag.ListInvocationVent),
			"Comment t'as perdu ta main ?",
			_open_story_lost_hand
		)])
	)])
	
func _open_story_lost_hand() -> void : 
	gui.open_dialog(pnj_name, _TEXT_3)
	if not bag.contain(Bag.Ossement):
		tags.add(Tags.KNOW_BONE_SKULL_STORY) 

const _TEXT_1 = "un text de presentation assez simple qui doit contenir que tu as été un pirate au sertvice de whisp mais que ce n'est plus le cas" 
const _TEXT_2 = "une premiere histoire qui raconte ta rencontre avec wisp et que suite au aventure que tu as vecu avec wisp, t'as perdu ta main et tu prefere ne plus partir a l'aventure avec lui car c'est trop dangeureux comme le montre les blessaure que tu porte"
const _TEXT_3 = "Un histoire assez precise qui explique comment tu as perdu ta main. 
Il faudrait que lors d'une aventure vous vous êtes echoué sur une ile, a cause d'une intemperie, a cause d'une attaque de monstra marrin comme un kraken, comme tu veux. 
Tu t'es retrouver avec le bras coincer dans l'epave du bateau. Whisp est partit chercher du secours, mais comme d'hab il a oublier (le whisp du jeu oublie tous) Et t'as été obliger de te couper toi même la main pour survive."
