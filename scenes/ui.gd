extends CanvasLayer

var jump_pressed := false
var joystick_direction := 0

@onready var jump_area = $JumpArea
@onready var left_button = $LeftButton
@onready var right_button = $RightButton

func _ready():
	visible = DisplayServer.is_touchscreen_available()

func _process(_delta):
	jump_pressed = Input.is_action_pressed("touch") and jump_area.get_global_rect().has_point(get_viewport().get_mouse_position())

	joystick_direction = 0
	if left_button.is_pressed():
		joystick_direction -= 1
	if right_button.is_pressed():
		joystick_direction += 1
