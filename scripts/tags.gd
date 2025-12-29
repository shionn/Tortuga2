extends Object

class_name Tags

const CHERCHE_FRUIT_DEFENDU = "search_fruit_defendu"
const CHERCHE_FRUIT_DEFENDU_2 = "search_fruit_defendu_2"

var tags : Array[String] = []

func add(tag:String) -> void : 
	if not(tag in tags) :
		self.tags.append(tag)

func have(tag:String) -> bool :
	return tag in tags

func remove(tag:String) -> void :
	var idx = tags.bsearch(tag)
	if idx != -1 :
		tags.remove_at(idx)
	
func save() -> void :
	var file = FileAccess.open("user://tags.save", FileAccess.WRITE)
	file.store_line(JSON.stringify(tags))

func load() -> void : 
	if FileAccess.file_exists("user://tags.save") :
		var file = FileAccess.open("user://tags.save", FileAccess.READ)
		tags.clear()
		for tag in JSON.parse_string(file.get_line()) :
			tags.append(tag)
