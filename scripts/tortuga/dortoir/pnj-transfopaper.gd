extends PNJ


func _ready() -> void:
	super._ready()
	_sleep()

func on_interact() -> void:
	if tags.have(Tags.FOUND_CARTOGRAPH) : 
		gui.open_dialog_next(Dialog.pnjSay(self, _TEXT_AFTER_RECRUTEMENT))
	elif tags.have(Tags.TRANSFOPAPER_SOBERING) :
		_dialog_sobre()
	else :
		gui.open_dialog_next(Dialog.pnjSay(self, _TEXT_IVRE)
			.on_close(func() : tags.add(Tags.SEARCH_SOBERING_POTION)))

func on_item_drop(_item : Item) -> void:
	if _item.name == Bag.PotionDegrisement and not tags.have(Tags.TRANSFOPAPER_SOBERING):
		tags.add(Tags.TRANSFOPAPER_SOBERING)
		bag.unloot(Bag.PotionDegrisement)
		_dialog_sobre()
	elif _item.name == Bag.LivreTransfo :
		gui.open_dialog_next(Dialog.pnjSay(self, _TEXT_RETURN_BOOK_1)
			.next(Dialog.playerSay(player, _TEXT_RETURN_BOOK_2)
				.next(Dialog.pnjSay(self, _TEXT_RETURN_BOOK_3)
					.next(Dialog.playerSay(player, Dialog.SEARCH_CARTOGRAPH[0])
						.next(Dialog.pnjSay(self, _TEXT_RETURN_BOOK_5)
							.on_close(_endBookReturn))))))
	else :
		super.on_item_drop(_item)

func _dialog_sobre() -> void:
	gui.open_dialog_next(Dialog.pnjSay(self, _TEXT_SOBRE)
		.option_dialog(Dialog.SEARCH_CARTOGRAPH[0], Dialog.playerSay(player, Dialog.SEARCH_CARTOGRAPH[1])
			.next(Dialog.pnjSay(self, _TEXT_SEARCH_CARTOGRAPH)
				.next(Dialog.playerSay(player, _TEXT_ASK_ABOUT_BOOK)
					.next(Dialog.pnjSay(self, _TEXT_ASK_ABOUT_BOOK_ANSWER).on_close(
						func() : tags.add(Tags.SEARCH_BOOK_TRANSFOPAPER)))))))

func _endBookReturn() -> void:
	bag.unloot(Bag.LivreTransfo)
	tags.remove(Tags.SEARCH_CARTOGRAPH)
	tags.remove(Tags.SEARCH_BOOK_TRANSFOPAPER)
	tags.add(Tags.FOUND_CARTOGRAPH)

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

const _TEXT_SEARCH_CARTOGRAPH = """Un cartographe ? N’importe qui est capable de lire une carte ou de faire une carte c’est un jeu d’enfant. 

Mais je suis désolé je n’ai pas le temps je cherche mon livre."""

const _TEXT_ASK_ABOUT_BOOK = "Un livre ? Quel livre tu cherches ?"

const _TEXT_ASK_ABOUT_BOOK_ANSWER = """Oui je ne retrouve plus mon livre, je l’avais hier j’en suis sur. Mais je me souviens de rien j’ai trop bu hier soir à l’auberge.

C’est un livre rouge, avec des symboles runiques dessus. C’est très important que je le retrouve, si il tombe entre de mauvaises mains ça serait une catastrophe."""

const _TEXT_RETURN_BOOK_1 = """Merci d'avoir retrouvé mon carnet, mais c’est quoi cette odeur ?"""
const _TEXT_RETURN_BOOK_2 = """J’ai retrouvé le carnet dans une flaque de vomi. """
const _TEXT_RETURN_BOOK_3 = """Ha ben super alors, enfin au moins je l’ai maintenant. Merci.

Comment je peu te remercier ?"""
const _TEXT_RETURN_BOOK_5 = """Vu que je suis interdit à l’auberge, et comme grâce à toi j’ai retrouvé mon livre, je n’ai plus aucun intérêt à rester sur l'île.

Je t’accompagne avec plaisir."""

const _TEXT_AFTER_RECRUTEMENT = """J’ai hâte de quitter l'île pour montrer mes talents dans d'autres auberges. 

Quand est-ce qu’on lève l'ancre ?"""
