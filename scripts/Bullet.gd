extends Node2D


const speed = 150
var stop_and_go = false
var wavy_line = false

var point = Vector2.ONE

func _process(delta):
	if stop_and_go:
		yield(get_tree().create_timer(2), "timeout")
		stop_and_go = false
	
	else:
		position -= transform.x * speed * delta
		#rotation_degrees += sin(position.y/10)*2
	"""
	elif type == "":
		position += transform.y * speed * delta
		if position.distance_to(point) >= 50:
			position -= transform.x * speed * delta
		global_rotation = position.angle_to_point(point)
	elif wavy_line:
		position -= transform.x * speed * delta
		global_position.x += sin(position.y/50)*5
	"""
		


func _on_Timer_timeout():
	queue_free()
