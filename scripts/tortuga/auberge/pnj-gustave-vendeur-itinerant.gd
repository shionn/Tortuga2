extends "res://scripts/pnj.gd"

@onready var kindle = $"/root/World/Tortuga/Plage-O/Kindle" as PNJ

func on_interact() -> void:
	var text = _TEXT
	if tags.have(Tags.KINDLE_RETURN_GUSTAF) :
		text = _TEXT_AFTER_KINDLE_RETURN
	gui.open_dialog_next(Dialog.pnjSay(self, text)
		.option_search_forbid_fruit()
		.option_search_forbid_fruit_montain()
		.option_search_forbid_fruit_montain_teleport()
		.option_hung_connut_search_charpentier()
		.option_action(Dialog.SEARCH_WOOD[0],
			_on_seach_wood,
			Dialog.SEARCH_WOOD_CONDITION(self)
		)
		.option_dialog("Kindle ?", 
			Dialog.playerSay(player, "Je crois que je te ramenne ton Kindle.")
				.next(Dialog.pnjSay(self,_TEXT_RETURN_KINDLE)
					.on_close(_on_return_kindle)),
			func (): return kindle.follow && global_position.distance_to(kindle.global_position) < 10
		)
	)
	
func on_item_drop(_item : Item) -> void:
	if _item.name == Bag.Houblon :
		gui.open_dialog_next(Dialog.pnjSay(self, _TEST_SHOW_HOUBLON))
	else :
		super.on_item_drop(_item)

func _on_seach_wood() -> void:
	if tags.have(Tags.KINDLE_RETURN_GUSTAF) :
		gui.open_dialog_next(Dialog.playerSay(player, Dialog.SEARCH_WOOD[1])
			.next(Dialog.pnjSay(self, _TEXT_SEARCH_WOOD_AFTER_KINDLE)
				.on_close(_on_wood_receive)
			)
		)
	else :
		gui.open_dialog_next(Dialog.playerSay(player, Dialog.SEARCH_WOOD[1])
			.next(Dialog.pnjSay(self,_TEXT_SEARCH_WOOD)
				.on_close(func(): tags.add(Tags.HUNG_CONNUT_SEARCH_HOUBLON))
			)
		)

func _on_return_kindle() -> void: 
	tags.add(Tags.KINDLE_RETURN_GUSTAF)
	tags.remove(Tags.HUNG_CONNUT_SEARCH_HOUBLON)
	bag.unloot(Bag.Houblon)

func _on_wood_receive() -> void:
	bag.loot(Bag.BoisDeQualite)
	tags.remove(Tags.HUNG_CONNUT_SEARCH_WOOD)
	play_anim_interact()
	
	
const _TEXT = """Bonjour, je m'appelle Goustaf ya.
Je peux te trouver n'importe quoi qu'on ne trouve pas naturellement sur l'île.

T'aurais pas vu Kindle ? Comment ça ? Tu connais pas Kindle ? Kindle ben c'est mon cheval pardi !"""

const _TEXT_AFTER_KINDLE_RETURN = """Merci hein ! Yaaa, Milles merci de m’avoir rapporté mon Kindle ! Vilain Kindle, t’as pas intérêt à en mettre partout cette fois ci et si tu continues je vais devoir t’attacher à un arbre.

Est-ce que je peux faire quelque chose pour toi pour te remercier ? """

const _TEXT_SEARCH_WOOD = """Ah yo les amis ! Mais bien sûr que je peux vous trouver du bois! Qu’est ce que vous croyez, Gutsaf il peut tout avoir ya. Mais Gustaf demande quelque chose en échange aussi ya. 

Mon poney, Kindle, ce satané buté d’animal a disparu, ya, il est surement allé gambader sur l'île pour manger du houblon. C’est pas bon pour lui, ça lui file des gaz et il en met partout. 

J’ai pas encore réussi à le retrouver, si tu m’aides alors ça me laissera le temps de te trouver du bois et tu me rendras service ya ! Alors tu acceptes ?"""

const _TEXT_SEARCH_WOOD_AFTER_KINDLE = """Pour te remercier de m’avoir rapporté mon Kindle, je veux bien te donner une montagne de bois de qualité ya, parce que Gustaf il a que de la qualité tu vois. 

Et comme ça on sera quitte ya, c’est important de  payer ses dettes !"""

const _TEXT_RETURN_KINDLE = """Merci ! Mille merci de m’avoir rapporté mon kindle ! 

Est-ce que je peux faire quelque chose pour toi ?"""

const _TEST_SHOW_HOUBLON = """Mon Kindle adore le houblon ya, il est malade comme un sac à puces avec, mais il suivrait n’importe qui du moment que tu lui présente du Houblon.

Il est accro ya, c’est une plaie."""

const _TEXT_SEARCH_WIND = """Du vent ? Mais y a plus de vent, tu vois bien! Moi j’ai qu’un talisman qui fait pfffff quand j'éternue mais ça fait pas assez de vent ya. 

Sinon j’ai un soufflet, pas celui que tu manges, il est à la banane suila, celui avec lequel tu pompes pour avoir de l’air ya. Tu vois ceque c’est ? Tiens regarde pfff pfff, ça marche tu peux même souffler sur les braises avec ! J’te le fait 5 pièces d’or ? Mais parce que t’as retrouvé Kindle, Allez comme t'hésite, 3 pièces d’or mais j’peux pas descendre plus bas sinon j’ai mal au dos hahahahahahaha ! J’rigole bien sûr mais 3 Pièces d’or c’est un bon prix! Il dit quoi ? Il prend ?"""
