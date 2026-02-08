extends "res://scripts/pnj.gd"

func on_interact() -> void:
	gui.open_dialog_next(Dialog.pnjSay(self,_TEXT_1)
		.option_dialog("Travail pour Whisp ?", Dialog.playerSay(player, "Pourquoi tu ne travailles plus pour Whisp ?")
			.next(Dialog.pnjSay(self, _TEXT_2_1).next(Dialog.pnjSay(self, _TEXT_2_2)
				.option_dialog("Ta main ?", 
					Dialog.playerSay(player,"Raconte-moi comment t’as perdu ta main.")
						.next(Dialog.pnjSay(self,_TEXT_3_1).next(Dialog.pnjSay(self, _TEXT_3_2).next(Dialog.pnjSay(self,_TEXT_3_3).next(Dialog.pnjSay(self,_TEXT_3_4)
							.on_close(func() : if not bag.contain(Bag.Ossement): tags.add(Tags.KNOW_BONE_SKULL_STORY) )
						)))), 
					func(): return bag.contain(Bag.ListInvocationVent))
			))
		)
		.option_dialog("Un os ?", 
			Dialog.playerSay(player,"Tu peux me donner un de tes os ?")
				.next(Dialog.pnjSay(self, _TEXT_4).on_open(play_anim_no)),
			func(): return bag.contain(Bag.ListInvocationVent)
		)
	)

const _TEXT_1 = "Moi c’est Boneskull. Autrefois, j’étais pirate au service de Whisp. 
On a sillonné les mers ensemble, affronté des tempêtes et des monstres... Mais ça, c’était avant. Aujourd’hui, je ne navigue plus avec lui. J’ai rangé ma vie d’aventure. 

Certaines blessures te rappellent quand il est temps de rester à quai." 

const _TEXT_2_1 = "Ah... Whisp. Je l’ai rencontré dans une taverne qui sentait le rhum et la poudre. Il parlait trop, rêvait grand, et oubliait déjà où il avait posé son sabre. Mais il avait ce feu dans les yeux, alors je l’ai suivi.
On a vécu des aventures que peu de pirates peuvent raconter sans trembler. Des trésors maudits, des mers déchaînées, des créatures qui n’auraient jamais dû exister.
Et puis un jour, lors d’une de ces aventures... j’ai perdu ma main."
const _TEXT_2_2 = "Whisp, lui, voyait encore l’aventure. Moi, je voyais mes os fendus, mes blessures mal refermées, et ce vide là où ma main se trouvait autrefois.
Alors j’ai compris : [i]partir avec lui, c’était signer pour une mort certaine[/i]. Même pour un squelette, y a des limites. Depuis ce jour, je ne l’accompagne plus."

const _TEXT_3_1 = "Très bien... Mais écoute bien.
On était en mer quand le ciel s’est retourné contre nous. Une tempête monstrueuse. Des vagues comme des montagnes. Et comme si ça ne suffisait pas... Quelque chose a frappé la coque.
Des tentacules. Un monstre marin, immense. Kraken, ou pire encore. Le navire a été broyé, jeté contre les récifs."

const _TEXT_3_2 = "On s’est échoués sur une île. Enfin... “échoués”... c’était de l’autre côté de l’île. À quelques centaines de mètres du port. La pire des ironies.

Moi, j’étais coincé. Le bras pris dans l’épave, le bois écrasé autour de mes os. La marée montait. Lentement. Trop lentement."

const _TEXT_3_3 = "Whisp a juré qu’il allait chercher de l’aide. Puis il est parti.
Il a oublié... [soupir]
Comme toujours... [soupir] Enfin Bref."

const _TEXT_3_4 = "L’eau montait. Quelque chose bougeait sous la surface. Des crocs, des pinces... Je le sentais.
Alors j’ai fait ce qu’un pirate doit parfois faire pour survivre.
J’ai attrapé une lame. Et je me suis coupé la main.
Quand Whisp est enfin revenu, il était soulagé. Moi, j’avais survécu... Mais ce jour-là, j’ai laissé plus qu’une main sur cette plage. J’y ai laissé mon goût pour l’aventure."


const _TEXT_4 = "Hors de question. J’ai déjà perdu assez de morceaux comme ça. 
Si je commence à en distribuer, je vais finir en tas décoratif."
