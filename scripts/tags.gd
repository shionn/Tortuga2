extends Object

class_name Tags

const FORBID_FRUIT_SEARCH = "001"
const FORBID_FRUIT_SEARCH_MONTAGNE = "002"
const FORBID_FRUIT_SEARCH_TELEPORT = "003"
const FORBID_FRUIT_SEARCH_SOBERING_POTION = "004"

var tags : Array[String] = []

func add(tag:String) -> void : 
	if not(have(tag)) :
		self.tags.append(tag)

func have(tag:String) -> bool :
	return tags.has(tag)

func remove(tag:String) -> void :
	tags.erase(tag)
	
func save() -> void :
	var file = FileAccess.open("user://tags.save", FileAccess.WRITE)
	file.store_line(JSON.stringify(tags))

func load() -> void : 
	if FileAccess.file_exists("user://tags.save") :
		var file = FileAccess.open("user://tags.save", FileAccess.READ)
		tags.clear()
		for tag in JSON.parse_string(file.get_line()) :
			tags.append(tag)
