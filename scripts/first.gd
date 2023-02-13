extends Node2D

#variables

#including nodes
onready var text_box_main = get_node("text_box")
onready var text_box_name = get_node("text_box/name")
onready var text_box_text = get_node("text_box/text")
onready var text_box_tween = get_node("text_box/tween")

onready var spider_pos = Vector2(get_node("player_pos").position)
onready var player_pos = Vector2(get_node("narrator_pos").position)

#dicitionaries
onready var char_dict = {
	"P": ["John", player_pos, "#00ee00"],
	"I": ["narrator", player_pos, "#555555"],
	"D": ["Simon", Vector2.ZERO, "#ffffff"]
}

onready var player_name = char_dict["P"][0]
onready var date_name = char_dict["D"][0]
#arrays
onready var Dmegalist = [
	["P","Today is the day!"],
	["P","The day for the date!"],
	["P","The date with the guy I met at the supermarket a few months ago!"],
	["I",player_name+" can hardly contain his excitement because he's been waiting to go on this date all week."],
	["I",date_name+" and "+player_name+"'s relationship has been slowly growing throughout the past few months and today they will be taking it to the next level by going on their first date."],
	["I","They met by chance at the their local supermarket and bonded over their love for their favorite cereal and video games."],
	["I",player_name+" get's ready ready for his date, gets dressed up nice and spiffy, and leaves for the local diner."]
]

var counter = 0
var done = false

func _ready():
	dio(0)

func _process(_delta):
	#if progress story
	if Input.is_action_just_pressed("ACCEPT") && !done:
		counter += 1
		if counter >= Dmegalist.size():
			counter = Dmegalist.size()-1
			get_out()
		dio(counter)

# Function to show diolouge box
func dio(test):
	# name box, name color, box position, main text
	text_box_name.text = char_dict[Dmegalist[test][0]][0]
	text_box_name.get_stylebox("normal").set_bg_color(char_dict[Dmegalist[test][0]][2])
	text_box_main.position = char_dict[Dmegalist[test][0]][1]
	text_box_text.text = Dmegalist[test][1]
	text_box_text.percent_visible = 0
	text_box_tween.interpolate_property(text_box_text, "percent_visible", 0, 1, 1, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	text_box_tween.start()

func get_out():
	text_box_main.hide()
	done = true
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene("res://scenes/main/date.tscn")
