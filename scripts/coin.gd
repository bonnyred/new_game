extends Area2D

@onready var game_manager = %GameManager
@onready var animation_player = $AnimationPlayer
@onready var label = $"../../Player/CanvasLayer/Label"
func _on_body_entered(body):
	game_manager.add_point()
	label.text = "Coins: " + str(Data.score)
	animation_player.play("pickup")
