extends Node2D

#variables

#including nodes
onready var black = get_node("Node2D/ColorRect")

onready var text_box_main = get_node("text_box")
onready var text_box_name = get_node("text_box/name")
onready var text_box_text = get_node("text_box/text")
onready var text_box_tween = get_node("text_box/tween")

onready var player = get_node("player_box/player")
onready var player_box = get_node("player_box")
onready var player_box_anim = get_node("player_box/anim")

onready var player_pos = Vector2(get_node("player_pos").position)
onready var date_pos = Vector2(get_node("date_pos").position)
onready var nar_pos = Vector2(get_node("nar_pos").position)
onready var wait_pos = Vector2(get_node("wait_pos").position)

onready var simon_sprite = get_node("Simon")
onready var simon_sprite_anim = get_node("Simon/Simon_anim")

const sad_bullet_scene = preload("res://scenes/objects/sad_bullet.tscn")
const heart_bullet_scene = preload("res://scenes/objects/heart_bullet.tscn")


#dicitionaries
onready var char_dict = {
	"P": ["John", player_pos, "#00ee00"],
	"D": ["Simon", date_pos, "#a100ff"],
	"N": ["narrator", nar_pos, "#555555"],
	"W": ["Waiter", wait_pos, "#fca80e"],
}


onready var player_name = char_dict["P"][0]
onready var date_name = char_dict["D"][0]
#arrays
onready var Dmegalist = [
	["N",player_name+" showed up a bit early so he claims a booth and orders a coffee.", ""],
	["N","He watches people talk to each other, waiters bringing people food, and cars drive by through a window.", ""],
	["N",player_name+" feels his anxiety start to slowly show itself.", "show_anxiety"],
	["P","*sigh*", ""],
	["P","Sheesh, why am I feeling so anxtious?", "anxiety"],
	["P","I know "+date_name+" quite well and it's just a date.", ""],
	["P","I've been on dates before so I have nothing to worry about.", "hearts"],
	["N",player_name+" checks his phone. They had planned on meeting at 1pm, it is currently 1:06.", ""],
	["P","Did I go to the right place? Is today the correct day?", "anxiety"],
	["P","Maybe he's just running late...", ""],
	["P","...", ""],
	["N",player_name+" takes out his phone to play a game.", "phone_game"],
	["P","Wonderful", ""],
	["D","Sup, nerd!", "date_slide"],
	["N",player_name+" get's flustered and quickly puts his phone away.","phone_hide"],
	["P","Hey, dork", "anxiety"],
	["P","You're late!", ""],
	["D","Yeah, I know, I'm sorry.","normal_ver"],
	["P","Was there traffic?", ""],
	["D","Nah", ""],
	["D","If I'm being honest, I was just playing games and lost track of time haha", "normal_ver"],
	["P","Bruh moment.", ""],
	["P","I can't get too mad at you though since I do the same all the time.", ""],
	["D","Yeah... It be that way sometimes.", ""],
	["D","Anyways, how are you doing today?", ""],
	["P","I am pretty alright. Work sucks, but you know, other than that there isn't much to complain about...", ""],
	["N",player_name+" stares into "+date_name+"'s eyes.", ""],
	["P","Especially now that you're here~", "hearts"],
	["N",date_name+" blushes", "date_blush"],
	["D","Heh, thanks "+player_name+", I really appreicate that.", "hearts"],
	["N",player_name+" takes "+date_name+"'s hand and holds it.", ""],
	["P","So, how are you doing?", ""],
	["N",date_name+" takes a second to compose himself, clearly very flustered.", "date_normal"],
	["D","I am doing well.", ""],
	["D","I didn't have work today, but I had a pretty rude encounter with a customer yesterday.", "anxiety"],
	["P","Oh dang, what happened?", ""],
	["P","If you don't mind me asking.", ""],
	["D","I had a Karen come in.. or well I guess whatever the male version of that is", ""],
	["D","And they asked to see the manager because they claimed I sold them the wrong thing", ""],
	["P","Dang, was it really the wrong thing?", ""],
	["D","That's the thing...", ""],
	["D","I had never seen this person in my entire life.", "anxiety"],
	["D","My manager came out and put that guy in his place", ""],
	["D","but man... that really shook me up", "anxiety"],
	["D","He was yelling and being childish", "anxiety"],
	["P","Dang, I'm really sorry you had to go through that", ""],
	["N",date_name+" is visibly uncomfortable reliving the memory. He is looking down at the table, trying to avoid contact.", "anxiety"],
	["N",player_name+" squeezes "+date_name+"'s hand to get his attention.",""],
	["P","Hey, that guy is an asshole", ""],
	["N","That seemed to have gotten "+date_name+"'s attention. He looks up at "+player_name+"'s face.",""],
	["P","Don't let that guy to you, he's not worth the time of day.", "normal_hor"],
	["N","That seemed to have helped "+date_name+" become more grounded.", "normal_hor"],
	["D","Y'know what?", ""],
	["D","You're right!", ""],
	["D","fuck that guy", ""],
	["P","That's the spirit!", "hearts"],
	["P","Now how about we get you some food?", ""],
	["D","Sounds great to me", "normal_ver"],
	["N",player_name+" waves over a waiter.", ""],
	["W","What'll it be fellas?", ""],
	["P","Can I get a short stack of pancakes?", ""],
	["W","Of course, and what about you, sir?", ""],
	["D","I'll have chicken and waffles and some water, please!", ""],
	["W","Of course!", ""],
	["W","Alright, I'll have that out for y'all soon.", ""],
	["N","The waiter shuffles off to other tables, coming back briefly to bring "+date_name+" his water.",""],
	["P","So what games have you been playing?", "normal_hor"],
	["D","Oh uhhh", ""],
	["D","Lot's of visual novels", ""],
	["D","and I've really been playing a lot of the latest Faucet game", ""],
	["P","Oh, I love Faucet!", ""],
	["P","I really hope they make a third Teleporter game.", ""],
	["D","Yeah, same.", ""],
	["P","What's their latest game like?",""],
	["D","It's a first person shooter set in a sci-fi dystopia.",""],
	["D","and the gameplay is really fun and I've gotten pretty invested in the story",""],
	["P","Wow, I might have to pick that one up and play it.",""],
	["D","You really should!",""],
	["D","Actually, you know what?",""],
	["D","I'm almost done with it, I can lend it to you when I finish it.","normal_ver"],
	["P","Oh hellll yeah, thank you.",""],
	["D","Yeah, no problem.","hearts"],
	["N","The waiter comes back with their food.",""],
	["W","Enjoy, kings","normal_ver"],
	["P","Thank you!","normal_hor"],
	["D","Yeah, thanks.",""],
	["N","They both eat dig in.",""],
	["D","Hey, how about, when I lend you that game, I come over and watch you play it?","normal_ver"],
	["P","Sounds great to me~","hearts"],
	["D","Great...",""],
	["D","Then it's a date~","hearts"],
	["N","To be continued..?",""]
]

onready var BDmegalist = [
	["D","Hey are you feeling alright?"],
	["P","U-uhh.."],
	["P","I'm feeling quite anxtious..."],
	["D","Hey, it's alright, I get it."],
	["D","Would you like to go home?"],
	["P","I-I don't know, I don't want to have wasted your time coming out here."],
	["D","Hey, it's completely fine, we don't have to do this today if you're not ready."],
	["D","Wanna try again a different day?"],
	["P","Y-yeah, yes please."]
]


var counter = 0
var bad_ending_counter = 0
var ending = false
var switching_scenes = false

func _ready():
	#black.modulate.a = 1
	black.show()
	$phone_game.set_process(false)
	$phone_game/ball.set_physics_process(false)
	$phone_game/pattle.set_physics_process(false)
	dio(0)

func _process(_delta):
	#if progress story
	
	
	if black.modulate.a <= 0.01 && !switching_scenes:
		black.hide()
	elif !switching_scenes:
		black.set_modulate(lerp(black.get_modulate(), Color(1,1,1,0), 0.05))
	if $player_box.health <= 0:
		if !ending:
			get_node("bullets").queue_free()
			dio_bad_end(0)
		ending = true
		if Input.is_action_just_pressed("ACCEPT") && !switching_scenes:
			bad_ending_counter += 1
			if bad_ending_counter >= BDmegalist.size():
				bad_ending_counter = BDmegalist.size()-1
				get_out("bad_ending")
			dio_bad_end(bad_ending_counter)
	else:
		if Input.is_action_just_pressed("ACCEPT") && !switching_scenes:
			counter += 1
			if counter >= Dmegalist.size():
				counter = Dmegalist.size()-1
				get_out("good_ending")
			dio(counter)

# Function to show diolouge box
func dio(test):
	# name box, name color, box position, main text
	text_box_name.text = char_dict[Dmegalist[test][0]][0]
	text_box_name.get_stylebox("normal").set_bg_color(char_dict[Dmegalist[test][0]][2])
	text_box_main.position = char_dict[Dmegalist[test][0]][1]
	text_box_text.text = Dmegalist[test][1]
	text_box_text.percent_visible = 0
	var time = 1
	if text_box_text.text.length() <= 20:
		time = 0.5
	text_box_tween.interpolate_property(text_box_text, "percent_visible", 0, 1, time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	text_box_tween.start()
	
	#bullets stuffs
	if !(Dmegalist[test][2] == ""):
		events(text_box_main.position, Dmegalist[test][2])

# Function to show diolouge box
func dio_bad_end(test):
	# name box, name color, box position, main text
	text_box_name.text = char_dict[BDmegalist[test][0]][0]
	text_box_name.get_stylebox("normal").set_bg_color(char_dict[BDmegalist[test][0]][2])
	text_box_main.position = char_dict[BDmegalist[test][0]][1]
	text_box_text.text = BDmegalist[test][1]
	text_box_text.percent_visible = 0
	var time = 1
	if text_box_text.text.length() <= 20:
		time = 0.5
	text_box_tween.interpolate_property(text_box_text, "percent_visible", 0, 1, time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	text_box_tween.start()

var temp_rot = 0
func events(pos, type):
	if type == "anxiety":
		for n in 20:
			var random_adder = rand_range(-15,15)
			temp_rot = pos.angle_to_point(player.global_position) + deg2rad(random_adder)
			shoot_bullet("sad", pos, temp_rot)
			yield(get_tree().create_timer(0.05), "timeout")
	elif type == "hearts":
		for n in 20:
			var random_adder = rand_range(-15,15)
			temp_rot = pos.angle_to_point(player.global_position) + deg2rad(random_adder)
			shoot_bullet("love", pos, temp_rot)
			yield(get_tree().create_timer(0.05), "timeout")
	elif type == "normal_hor":
		for n in 20:
			temp_rot = pos.angle_to_point(player.global_position)
			shoot_bullet("love", Vector2(pos.x-50,pos.y), temp_rot)
			yield(get_tree().create_timer(0.05), "timeout")
			temp_rot = pos.angle_to_point(player.global_position)
			shoot_bullet("sad", pos, temp_rot)
			yield(get_tree().create_timer(0.05), "timeout")
			temp_rot = pos.angle_to_point(player.global_position)
			shoot_bullet("love", Vector2(pos.x+50,pos.y), temp_rot)
			yield(get_tree().create_timer(0.05), "timeout")
	elif type == "normal_ver":
		for n in 20:
			temp_rot = pos.angle_to_point(player.global_position)
			shoot_bullet("love", Vector2(pos.x,pos.y-50), temp_rot)
			yield(get_tree().create_timer(0.05), "timeout")
			temp_rot = pos.angle_to_point(player.global_position)
			shoot_bullet("sad", pos, temp_rot)
			yield(get_tree().create_timer(0.05), "timeout")
			temp_rot = pos.angle_to_point(player.global_position)
			shoot_bullet("love", Vector2(pos.x,pos.y+50), temp_rot)
			yield(get_tree().create_timer(0.05), "timeout")
	elif type == "date_slide":
		simon_sprite_anim.play("slide_in")
	elif type == "show_anxiety":
		player_box.modulate.a = 0
		player_box.show()
		player_box_anim.play("show_slow")
	elif type == "phone_game":
		$phone_game.set_process(true)
		$phone_game/ball.set_physics_process(true)
		$phone_game/pattle.set_physics_process(true)
		$phone_game/AnimationPlayer.play("show")
	elif type == "phone_hide":
		$phone_game.set_process(false)
		$phone_game/ball.set_physics_process(false)
		$phone_game/pattle.set_physics_process(false)
		$phone_game/AnimationPlayer.play("hide")
	elif type == "date_blush":
		$Simon.texture = load("res://assets/Simon_blush.png")
	elif type == "date_normal":
		$Simon.texture = load("res://assets/Simon.png")

func shoot_bullet(type, pos, rot):
	if !ending:
		if type == "sad":
			var bullet = sad_bullet_scene.instance()
			get_tree().root.get_node("World/bullets").call_deferred("add_child", bullet)
			bullet.position = pos
			bullet.global_rotation = rot
		if type == "love":
			var bullet = heart_bullet_scene.instance()
			get_tree().root.get_node("World/bullets").call_deferred("add_child", bullet)
			bullet.position = pos
			bullet.global_rotation = rot

func get_out(where):
	text_box_main.hide()
	switching_scenes = true
	yield(get_tree().create_timer(2), "timeout")
	if where == "bad_ending":
		$Node2D/ColorRect.modulate.a = 0
		$Node2D/ColorRect.show()
		$Node2D/AnimationPlayer.play("hide")
		yield($Node2D/AnimationPlayer, "animation_finished")
		get_tree().change_scene("res://scenes/main/bed_ending.tscn")
	if where == "good_ending":
		$Node2D/ColorRect.modulate.a = 0
		$Node2D/ColorRect.show()
		$Node2D/AnimationPlayer.play("hide")
		yield($Node2D/AnimationPlayer, "animation_finished")
		get_tree().change_scene("res://scenes/main/good_ending.tscn")
