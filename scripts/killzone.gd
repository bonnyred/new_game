extends Area2D

@onready var timer = $Timer
@onready var red_tint = get_node("/root/Game/CanvasLayer/RedTint")
@onready var death_label = get_node("/root/Game/CanvasLayer/DeathLabel")

func _on_body_entered(body):
	print("Red tint is:", red_tint)
	print("You died!")
	Engine.time_scale = 0.5

	# Show red tint and death label
	red_tint.visible = true
	red_tint.modulate.a = 0.0
	death_label.visible = true
	death_label.modulate.a = 0.0

	body.get_node("CollisionShape2D").queue_free()
	
	var tween = create_tween()
	tween.tween_property(red_tint, "modulate:a", 0.5, 0.1)
	tween.parallel().tween_property(death_label, "modulate:a", 1.0, 0.5) 
	
	tween.tween_callback(Callable(timer, "start"))


func _on_timer_timeout():
	var tween = create_tween()
	tween.tween_property(red_tint, "modulate:a", 0.0, 0.5)
	tween.parallel().tween_property(death_label, "modulate:a", 0.0, 0.5)
	tween.tween_callback(Callable(self, "_reset_game"))

func _reset_game():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
