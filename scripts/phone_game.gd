extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if $blocks.get_children() == []:
		win()

func win():
	$ball.direction = Vector2.ZERO
	$win_label.show()
