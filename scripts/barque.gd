extends Interactable

var pos = _TORTUGA

func on_interact() -> void:
	if bag.contain(Bag.PasseBarqueTanpon) :
		gui.open_dialog_next(Dialog.playerSay(player, """Aller ou ?""")
			.option_action("Retourner sur tortuga", func() : gui.doTransition(_goTortuga), func() : return pos != _TORTUGA)
			.option_action("Île de la shaman", func() : gui.doTransition(_goShamanIsland), func() : return pos != _SHAMAN_ISLAND)
			.option_dialog("Twin Isle", 
				Dialog.playerSay(player, "Je ne peux pas aller aussi loin avec une simple barque.")
					.on_open(func(): player.play_anim_no()),
				func(): return bag.contain(Bag.ParcheminHungConnut)
			)
			.option_dialog("Port Moustik", 
				Dialog.playerSay(player, "Je ne peux pas aller aussi loin avec une simple barque.")
					.on_open(func(): player.play_anim_no()),
				func(): return bag.contain(Bag.ParcheminHungConnut))
			.option_dialog("Port Bourik", 
				Dialog.playerSay(player, "Je ne peux pas aller aussi loin avec une simple barque.")
					.on_open(func(): player.play_anim_no()),
				func(): return bag.contain(Bag.ParcheminHungConnut))
			.option_dialog("Port Loustik", 
				Dialog.playerSay(player, "Je ne peux pas aller aussi loin avec une simple barque.")
					.on_open(func(): player.play_anim_no()),
				func(): return bag.contain(Bag.ParcheminHungConnut))
		)
	else :
		gui.open_dialog_next(Dialog.playerSay(player, """Sans une autorisation de la capitainerie je ne pourrai pas quitter le port."""))

func _goTortuga() -> void :
	player.teleport(Vector3(-7.2,1,12.6), deg_to_rad(0))
	global_position.x = -7.2
	global_position.z = 14.7
	global_rotation.y = deg_to_rad(0)
	pos = _TORTUGA
	
func _goShamanIsland() -> void :
	player.teleport(Vector3(279.7,1,96.6), deg_to_rad(114.4))
	global_position.x = 279.7
	global_position.z = 94.5
	global_rotation.y = deg_to_rad(178)
	pos = _SHAMAN_ISLAND

const _TORTUGA = 0
const _SHAMAN_ISLAND = 1
