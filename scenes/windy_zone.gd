extends Area2D

var player_inside = false
var player_body = null
var push_strength = 300
var push_duration = 0.3  # seconds after exiting to continue pushing
var push_timer = 0.0

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

func _on_body_entered(body):
	if body.name == "Player":
		player_inside = true
		player_body = body
		push_timer = push_duration

func _on_body_exited(body):
	if body.name == "Player":
		player_inside = false
		push_timer = push_duration 

func _process(delta):
	if player_body:
		if player_inside or push_timer > 0.0:
			var direction = (player_body.global_position - global_position).normalized()

			var current_strength = push_strength
			if not player_inside:
				# Fade out the push over time
				current_strength *= push_timer / push_duration
				push_timer -= delta

			player_body.position += direction * current_strength * delta

			# Safely clear after push finishes
			if not player_inside and push_timer <= 0.0:
				player_body = null
