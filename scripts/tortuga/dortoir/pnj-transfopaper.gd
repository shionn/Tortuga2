extends PNJ


func _ready() -> void:
	super._ready()
	_sleep()

func on_interact() -> void:
	if tags.have(Tags.FOUND_CARTOGRAPH) : 
		gui.open_dialog_next(Dialog.pnjSay(self, _TEXT_AFTER_RECRUTEMENT))
	elif tags.have(Tags.TRANSFOPAPER_SOBERING) :
		gui.open_dialog_next(Dialog.pnjSay(self, _TEXT_SOBRE)
			.option_dialog(Dialog.SEARCH_CARTOGRAPH[0], Dialog.playerSay(player, Dialog.SEARCH_CARTOGRAPH[1]))
		)
	else :
		gui.open_dialog_next(Dialog.pnjSay(self, _TEXT_IVRE)
			.on_close(func() : tags.add(Tags.SEARCH_SOBERING_POTION)))

func on_item_drop(_item : Item) -> void:
	pass


func _sleep() -> void:
	self.rotation.y = 0
	self._character.rotation.x=deg_to_rad(80)
	self._character.rotation.z=deg_to_rad(35)
	self._area.rotation.x=deg_to_rad(80)
	self._area.rotation.z=deg_to_rad(35)
	self.position = Vector3(-1.85, 4.55, 1.7)
	var idle = _animation.get_animation("idle")
	idle.loop_mode = Animation.LOOP_NONE
	_animation.play("idle")

func _awake() -> void:
	self.rotation.y = deg_to_rad(180)
	self._character.rotation=Vector3.ZERO
	self._area.rotation=Vector3.ZERO
	self.position = Vector3(-2.9, 4.02, 2.0)
	var idle = _animation.get_animation("idle")
	idle.loop_mode = Animation.LOOP_LINEAR
	_animation.play("idle")

const _TEXT_IVRE = """ZZZzzz
Laisse-moi tranquille, j'ai trop bu hier soir...
ZZZzzz"""

const _TEXT_SOBRE = """Merci, ca va mieux.

Bong sang de salerpilopette, tu n'aurais pas vu un carnet dans le coin ?"""

const _TEXT_AFTER_RECRUTEMENT = """J’ai hâte de quitter l'île pour montrer mes talents dans d'autres auberges. 

Quand est-ce qu’on lève l'ancre ?"""
