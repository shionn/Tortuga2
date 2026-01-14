extends Label

class_name Score

@onready var _bag = $"../Bag" as Bag
@onready var _tags = $"/root/World/Player/Tags" as Tags

var value = 0

func _ready() -> void:
	_tags.on_tag_change.connect(compute)
	_bag.on_item_change.connect(compute)
	
func compute() -> void :
	value = 0
	# quete 1 : min 1, max 2
	_item(Bag.TresorBarbeDrue, 1)
	_item(Bag.TresorBarbeDrueNet, 2) # remplace le TresorBarbeDrue
	
	# quete 2 : min 5, max 7
	_tag(Tags.BRASSERIE_HAVE_SOBERING_POTION, 1)
	_tag(Tags.GUARD_HARBOUR_OFFICE_SOBERING, 1)
	_item(Bag.CrystalTeleportationOasis, 1)
	_item(Bag.FruitDefendu, 1)
	_item(Bag.ParcheminBarbeDrueDecoder, 2) # remplace le FruitDefendu
	_item(Bag.CarteHungConnut, 1)
	
	#quete 3 : 
	_item(Bag.Houblon, 1)
	_tag(Tags.KINDLE_RETURN_GUSTAF, 2) # remplace le houblon
	_tag(Tags.ESCALATOR_CHAMPI_REPAIR, 1) # a voir si on le garde
	
	self.text = "Score : "+str(value)

func _item(item : String, inc : int) -> void:
	if _bag.contain(item) :
		value += inc

func _tag(tag : String, inc : int) -> void:
	if _tags.have(tag) :
		value += inc
