extends Object
class_name Bag

var items : Array[Item] = [] 

func loot(item : Item) -> void :
	# TODO ajoute un log dans la console
	items.append(item)
