extends Node

@onready var label = $"../Player/CanvasLayer/Label"


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

var score = 0
