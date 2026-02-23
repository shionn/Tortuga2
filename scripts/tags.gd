extends Node

class_name Tags

const TREASUR_BARBE_DRUE_OPENED = "000"
# Quete du fruit defendu
const FORBID_FRUIT_SEARCH = "001"
const FORBID_FRUIT_SEARCH_MONTAGNE = "002"
const FORBID_FRUIT_SEARCH_TELEPORT = "003"
const SEARCH_SOBERING_POTION = "004"
const GUARD_HARBOUR_OFFICE_SOBERING = "005"
const BRASSERIE_HAVE_SOBERING_POTION = "006"
const FORBID_FRUIT_LOOTED = "007"
# Quete de hung connu 
const HUNG_CONNUT_TEASUR_OPENED = "010"
const HUNG_CONNUT_SEARCH_ESCALTOR = "011"
const HUNG_CONNUT_SEARCH_CHARPENTIER = "012"
const HUNG_CONNUT_SEARCH_WOOD = "013"
const HUNG_CONNUT_SEARCH_HOUBLON = "014"
const ESCALATOR_CHAMPI_REPAIR = "015"
const KNOW_FERMIER_LOVE_OMELETTE = "016"
const CAN_LOOT_HOUBLON = "017"
const KINDLE_RETURN_GUSTAF = "018"
const WIND_BLOWING = "019"
const SEARCH_WIND = "020"
const SEARCH_BARQUE = "021"
const SEARCH_PASS = "022" 
const SEARCH_CAPTAIN_BOTTLE = "023" 
const ALLOW_PICKAXE = "024"
const TOMB_BARBE_DRUE_OPENED = "025"
const KNOW_BONE_SKULL_STORY = "026" 
# Quete d'équipage
const SEARCH_CARTOGRAPH = "030"
const SEARCH_NAVIGATEUR = "031"
const SEARCH_ECLAIREUR = "032"
const SEARCH_QUARTIER_MAITRE = "033"
const FOUND_CARTOGRAPH = "034"
const FOUND_NAVIGATEUR = "035"
const FOUND_ECLAIREUR = "036"
const FOUND_QUARTIER_MAITRE = "037"
const TRANSFOPAPER_SOBERING = "038"


var tags : Array[String] = []

signal on_tag_change()

func add(tag:String) -> void : 
	if not(have(tag)) :
		self.tags.append(tag)
	on_tag_change.emit()

func have(tag:String) -> bool :
	return tags.has(tag)

func remove(tag:String) -> void :
	tags.erase(tag)
	on_tag_change.emit()
	
func save_game() -> void :
	var file = FileAccess.open("user://tags.save", FileAccess.WRITE)
	file.store_line(JSON.stringify(tags))

func load_game() -> void : 
	if FileAccess.file_exists("user://tags.save") :
		var file = FileAccess.open("user://tags.save", FileAccess.READ)
		tags.clear()
		for tag in JSON.parse_string(file.get_line()) :
			tags.append(tag)
	on_tag_change.emit()
