extends Label

class_name Score

@onready var _bag = $"../Bag" as Bag
@onready var _player = $"/root/World/Player" as Player

var value = 0

func compute() -> void :
	value = 0
	# quete 1
	_item(Bag.TresorBarbeDrue, 1)
	_item(Bag.TresorBarbeDrueNet, 2) # remplace le TresorBarbeDrue
	
	# quete 2
	_tag(Tags.BRASSERIE_HAVE_SOBERING_POTION, 1)
	_tag(Tags.GUARD_HARBOUR_OFFICE_SOBERING, 1)
	_item(Bag.CrystalTeleportationOasis, 1)
	_item(Bag.FruitDefendu, 1)
	_item(Bag.ParcheminBarbeDrueDecoder, 2) # remplace le FruitDefendu
	_item(Bag.CarteHungConnut, 1)
	
	self.text = "Score : "+str(value)

func _item(item : String, inc : int) -> void:
	if _bag.contain(item) :
		value += inc

func _tag(tag : String, inc : int) -> void:
	if _player.tags.have(tag) :
		value += inc
