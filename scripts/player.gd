extends KinematicBody2D

var MAX_SPEED = 200
var ACCEL = 2000
var motion = Vector2.ZERO

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var axis = get_input_axis()
	if axis == Vector2.ZERO:
		apply_friction(ACCEL * delta)
	else:
		apply_movement(axis * ACCEL * delta)
	motion = move_and_slide(motion)

func get_input_axis():
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("RIGHT")) - int(Input.is_action_pressed("LEFT"))
	axis.y = int(Input.is_action_pressed("DOWN")) - int(Input.is_action_pressed("UP"))
	return axis.normalized()

func apply_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount
	else:
		motion = Vector2.ZERO

func apply_movement(accel):
	motion += accel
	motion = motion.clamped(MAX_SPEED)
