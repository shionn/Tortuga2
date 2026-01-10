extends Object

class_name Tags

const TREASUR_BARBE_DRUE_OPENED = "000"
const FORBID_FRUIT_SEARCH = "001"
const FORBID_FRUIT_SEARCH_MONTAGNE = "002"
const FORBID_FRUIT_SEARCH_TELEPORT = "003"
const SEARCH_SOBERING_POTION = "004"
const GUARD_HARBOUR_OFFICE_SOBERING = "005"
const BRASSERIE_HAVE_SOBERING_POTION = "006"
const FORBID_FRUIT_LOOTED = "007"
const HUNG_CONNUT_TEASUR_OPENED = "010"
const HUNG_CONNUT_SEARCH_ESCALTOR = "011"
const HUNG_CONNUT_SEARCH_CHARPENTIER = "012"

var tags : Array[String] = []
var _player : Player

func _init(player :Player) -> void:
	_player = player;

func add(tag:String) -> void : 
	if not(have(tag)) :
		self.tags.append(tag)
	_player._score.compute()

func have(tag:String) -> bool :
	return tags.has(tag)

func remove(tag:String) -> void :
	tags.erase(tag)
	_player._score.compute()
	
func save_game() -> void :
	var file = FileAccess.open("user://tags.save", FileAccess.WRITE)
	file.store_line(JSON.stringify(tags))

func load_game() -> void : 
	if FileAccess.file_exists("user://tags.save") :
		var file = FileAccess.open("user://tags.save", FileAccess.READ)
		tags.clear()
		for tag in JSON.parse_string(file.get_line()) :
			tags.append(tag)
	_player._score.compute()
