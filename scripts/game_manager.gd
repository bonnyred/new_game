extends Node

<<<<<<< HEAD

func add_point():
	Data.score += 1

func checkpoint(value):
	if value[0] > Data.x:
		Data.x = value[0]
		Data.y = value[1]
		

func get_check():
	if Data.x == 0:
		return null
	else:
		return Vector2(Data.x, Data.y)
=======
var score = 0

@onready var label = $"../Player/CanvasLayer/Label"

func add_point():
	score += 1
	label.text = "Coins: " + str(score)
>>>>>>> 3e238842044903ddcc1181358e59b5bc3e9fb226
