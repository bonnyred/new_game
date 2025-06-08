extends Node2D

const SPEED = 100
var only = 1

var direction = 1

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D
	
	
func _process(delta):
	var vala = get_meta('vala')
	if vala:
		if only == 1:
			direction = -1
			only = 0
	
	if ray_cast_right.is_colliding():
		animated_sprite.flip_h = false
		direction = -1
	if ray_cast_left.is_colliding():
		animated_sprite.flip_h = true
		direction = 1
		
		
	
	position.y += direction * SPEED * delta
