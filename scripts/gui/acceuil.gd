extends MarginContainer

func _ready() -> void:
	var text = $Panel/MarginContainer/VBoxContainer/HBoxContainer/RichTextLabel
	text.clear()
	text.append_text(_TEXT)
	
	
const _TEXT = """Ohé Amis [b]Pirates[/b],
Voilà déjà un moment que nous développons notre belle île de [color=yellow]Tortuga[/color] et le résultat est juste splendide.
Nous avons exploré bien des îles alentour et ramené quelques trésors mais quelque chose me murmure à l'oreille que ce n'est pas tout! Il  y a bien plus encore !

Vous l'avez peut être remarqué mais notre île et celles qui nous entourent semblent vivre par elles mêmes. Elles changent régulièrement même notre belle Tortuga ! Parfois des changements infimes et passant presque inaperçus jusqu'à des îles qui apparaissent et disparaissent du jour au lendemain. Des fois même des choses apparaissent ou disparaissent sur notre île. 
Et bien sûr tout cela sans aucune explication, il doit bien y avoir une raison mais il nous faudra mener l'[color=yellow]enquête[/color]. 

Vous l'aurez compris je soupçonne une force supérieure qui joue avec Tortuga et avec nous ! C'est pourquoi nous devons explorer encore et découvrir les trésors que, et j'en suis convaincu, cette puissance met à votre disposition pour qu'ils soient découverts. Qui sait quels trésors merveilleux nous pouvons découvrir mais plus encore qui sait qui est derrière tout ça ! 

Et foi de Pirate Maudit, nous allons le découvrir !

[color=yellow]L’aventure commence, tu es une jeune recrue, va donc te présenter auprès de Whisp.[/color]"""


func _on_button_pressed() -> void:
	hide()
