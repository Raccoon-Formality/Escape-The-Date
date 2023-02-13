extends Node2D

onready var health_bar = get_node("box/TextureProgress")

var health = 25



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	health_bar.value = health
	if health > 52:
		$box/heart.show()
	else:
		$box/heart.hide()


func _on_Area2D_area_entered(area):
	if area.is_in_group("good"):
		get_node("player/good_hit_sound").play()
		health += 1
		health = clamp(health,0,55)
	elif area.is_in_group("bad"):
		get_node("player/bad_hit_sound").play()
		health -= 1
	health = clamp(health,0,55)
	area.get_parent().get_parent().queue_free()
