extends "res://scripts/interactable.gd"


func on_interact() -> void:
	gui.open_dialog_next(Dialog.playerSay(player,_TEXT_1)
		.next(Dialog.playerSay(player,_TEXT_2)))

const _TEXT_1 ="""Cette bouteille contient une note illisible. Voici ce que je comprend:
	[i]B.... .. .s ..l..r... .. mal...
	...s .... n. ..ff... ..s,
	C.. .o.. ..p..t.. . ...min.
	R......s .. ....s s....t .e. p.. .[/i]"""

const _TEXT_2 = """	[i].... a...i...e .. ... . l. .i.. .. ..î...
	....i ... ...t... .. ...... ...... ... êtres Vil..
	..i .. b...n v...a...t s...p...r,
	...b. D.... ... l. c..m.. d... ..s ..r ...... r...e..[/i]"""
