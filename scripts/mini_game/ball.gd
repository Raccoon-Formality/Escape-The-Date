extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
var direction = Vector2.ZERO
var going = false

# Called when the node enters the scene tree for the first time.
#func _ready():
	


func _physics_process(delta):
	if Input.is_action_just_pressed("p") && !going:
		direction = Vector2(200,200)
		get_parent().get_node("Label").hide()
		going = true
	var coll = move_and_collide(direction*delta)
	if coll:
		#var reflect = coll.remainder.bounce(coll.normal)
		direction = direction.bounce(coll.normal)
	if position.y > 300:
		end()
		
func end():
	direction = Vector2.ZERO
	get_parent().get_node("lose_label").show()
