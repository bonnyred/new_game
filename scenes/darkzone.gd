extends Area2D

@onready var dark_overlay = $"../CanvasLayer2/RedTint" 
@onready var light: PointLight2D = $"../Player/PointLight2D"

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

func _on_body_entered(body):
	if body.name == "Player":
		dark_overlay.color = Color(0, 0, 0, 1.8) 
		dark_overlay.visible = true
		dark_overlay.modulate.a = 0.0
		light.visible = true
		var tween = create_tween()
		tween.tween_property(dark_overlay, "modulate:a", 0.5, 0.2)
		
func _on_body_exited(body):
	if body.name == "Player":
		var tween = create_tween()
		tween.tween_property(dark_overlay, "modulate:a", 0.0, 0.2)
		light.visible = false
		tween.connect("finished", Callable(self, "_on_fade_out_finished"))

func _on_fade_out_finished():
	dark_overlay.visible = false
