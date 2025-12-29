extends Object

class_name Tags

var tags : Array[String] = []

func save() -> void :
	var file = FileAccess.open("user://tags.save", FileAccess.WRITE)
	file.store_line(JSON.stringify(tags))

func load() -> void : 
	if FileAccess.file_exists("user://tags.save") :
		var file = FileAccess.open("user://tags.save", FileAccess.READ)
		tags.clear()
		for tag in JSON.parse_string(file.get_line()) :
			tags.append(tag)
