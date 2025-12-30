extends "res://scripts/interactable.gd"


func on_interact() -> void:
	gui.open_dialog("Bouteille", """Cette bouteille contient une note illisible. 

B.... .. .s ..l..r... .. mal...
...s .... n. ..ff... ..s,
C.. .o.. ..p..t.. . ...min.
R......s .. ....s s....t .e. p.. .

.... a...i...e .. ... . l. .i.. .. ..î...
....i ... ...t... .. ...... ...... ... êtres Vil..
..i .. b...n v...a...t s...p...r,
...b. D.... ... l. c..m.. d... ..s ..r ...... r...e..

.""")
