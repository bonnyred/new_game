extends Area2D

@onready var dark_overlay = $"../CanvasLayer2/RedTint" # Adjust path as needed

var player_inside = false
var player_body = null
func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

func _on_body_entered(body):
	if body.name == "Player":
		player_inside = true
		player_body = body
		
		dark_overlay.color = Color(1, 1, 1, 0.44) 
		dark_overlay.visible = true
		dark_overlay.modulate.a = 0.0
		var tween = create_tween()
		tween.tween_property(dark_overlay, "modulate:a", 0.5, 0.2)

func _on_body_exited(body):
	if body.name == "Player":
		player_inside = false
		player_body = null
		
		var tween = create_tween()
		tween.tween_property(dark_overlay, "modulate:a", 0.0, 0.2)
		tween.connect("finished", Callable(self, "_on_fade_out_finished"))

func _on_fade_out_finished():
	dark_overlay.visible = false

func _process(delta):
	if player_inside and player_body:
		player_body.position.x += 0.035 * delta
