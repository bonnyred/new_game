extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite = $AnimatedSprite2D

var swipe_start_pos: Vector2
var swipe_start_time := 0.0
var direction := 0
var jump_requested := false

const TAP_MAX_DURATION := 0.2  # seconds
const TAP_MAX_DISTANCE := 30.0

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			swipe_start_pos = event.position
			swipe_start_time = Time.get_ticks_msec() / 1000.0
		else:
			var duration = Time.get_ticks_msec() / 1000.0 - swipe_start_time
			var distance = swipe_start_pos.distance_to(event.position)
			if duration <= TAP_MAX_DURATION and distance <= TAP_MAX_DISTANCE:
				jump_requested = true  # It's a tap, so jump
			# When touch ends, stop movement
			direction = 0

	elif event is InputEventScreenDrag:
		var delta = event.position - swipe_start_pos
		if delta.length() > 50:
			if delta.x > 0:
				direction = 1  # Swipe right
			elif delta.x < 0:
				direction = -1  # Swipe left

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if jump_requested and is_on_floor():
		velocity.y = JUMP_VELOCITY
	jump_requested = false

	# Flip sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

	# Animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")

	# Movement
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
