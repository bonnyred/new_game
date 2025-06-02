extends Area2D

@onready var dark_overlay = $"../CanvasLayer2/RedTint" # Adjust path as needed
@onready var light = $"../Player/PointLight2D"
func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

func _on_body_entered(body):
	print("Entered by:", body.name, body)
	if body.name == "Player":
		dark_overlay.color = Color(0, 0, 0, 1.8) 
		light.visible = true
		dark_overlay.visible = true
		dark_overlay.modulate.a = 0.0
		var tween = create_tween()
		tween.tween_property(dark_overlay, "modulate:a", 0.5, 0.2)
		print(2)
		
func _on_body_exited(body):
	print("Left by:", body.name, body)
	if body.name == "Player":
		light.visible = false
		var tween = create_tween()
		tween.tween_property(dark_overlay, "modulate:a", 0.0, 0.2)
		tween.connect("finished", Callable(self, "_on_fade_out_finished"))

func _on_fade_out_finished():
	dark_overlay.visible = false
