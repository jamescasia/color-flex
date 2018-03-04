extends Node#classic
onready var player = get_node("Node2D/player")
onready var goal = get_node("Sprite/Node2D 2/player")
onready var fps = get_node("Camera2D/Label")
onready var red = get_node("res://red.png")
onready var blue = get_node("res://blue.png")
onready var green = get_node("res://green.png") 
signal reset
var resetted = false
var engu=0
var prevscore
var animscoretimer = 0
onready var food = get_node("food")
signal scoretimer
var gamectr
onready var timer = get_node("Camera2D/timer")
onready var resetbtn = get_node("Camera2D/resetbtn")
onready var gameoverlabel = get_node("Camera2D/gameoverlabel")
onready var scoreboard = get_node("Camera2D/scoreboard")
onready var tapctr = get_node("Camera2D/taps")
onready var timeleft = get_node("Camera2D/timeleft")
onready var timeleftx = get_node("Camera2D/timelefttxt")
onready var gametime = get_node("game timer")
signal leftrot
signal tapped
var score 
var afterrot
var highestscore
var currentscore
var taploop =0
signal rightrot
var clickcounter = 0
var beingpressed = false
signal mattecenter

signal start
var prevpos
signal mattepressryt
signal mattepresslft
var gameover = false
var ctr = 0
var taps = 0
var isrotating = 0
var ctr5 = 0
var ctr2 = 0
var ctr1 = 0
var velocity = Vector2(0, -1543)
var ctr6 = 0
var ctr7 =0
var angleinit1=0
var angleinit2=0
signal centeruy
var minuslen = 0
func _ready():
	resetbtn.set_hidden(true)
	gameoverlabel.set_hidden(true)
	timeleft.set_pos(Vector2(160, 1))
	set_process_input(true)
	afterrot =0.00
	set_fixed_process(true)
	pass
func _standard():
	if timeleft.get_pos().x < 34:
		timeleft.set_frame(2)
	if timeleft.get_pos().x < -143:
		timeleft.set_frame(1)
	if food.get("judgement") == false:
		gameover = true
	gameoverlabel.set_text("GAME OVER")
	prevscore = food.get("prevscore")
	currentscore = food.get("score")
	scoreboard.set_text(str(currentscore))
	
	#if currentscore - prevscore == 1:
		
		 
	 
		 
	
	
func _fixed_process(delta):
	_standard()
	if gameover == true:
			resetbtn.set_hidden(false)
			scoreboard.set_pos(Vector2(gameoverlabel.get_pos().x +166, gameoverlabel.get_pos().y +50))
			scoreboard.set_scale(Vector2(1,1))
			gameoverlabel.set_hidden(false)
			player.set_linear_velocity(Vector2(randi()%23,0))
			player.set_angular_velocity(randi()%23-46)
			player.set_gravity_scale(900)
			player.set_angular_damp(23)
			if player.get_pos().y <=-180:
				player.set_linear_velocity(Vector2(0,0))
				player.set_gravity_scale(0)
				player.set_pos(Vector2(0,0))
			
			
	else:	
		timeleftx.set_text(str(gametime.get_time_left()))
		if engu < 0:
			engu =2
		if engu >2:
			engu = 0
		score = taps
		tapctr.set_text(str(food.get("judgement")))
		#tapctr.set_text(str(taps))
		if taps ==0:
			emit_signal("start")
		if taps >=1:
			minuslen = minuslen + 0.2654
			timeleft.set_pos(Vector2(160-(minuslen), 1))
		#velocity.y = velocity.y +2
		#fps.set_text(str(OS.get_frames_per_second()))
		fps.set_text(str(player.get_rot()))
		_press_physics()
		
func _press_physics():
	
		if isrotating == 0:
			return
		while ctr6 < 1 and  isrotating == 23:
			beingpressed = true
			prevpos = player.get_pos()
			emit_signal("centeruy")
			emit_signal("mattecenter")
			player.set_linear_velocity(velocity)
			player.set_angular_velocity(0)
			ctr7 = 0
			ctr6 = ctr6 +1
				 
		
		while ctr5 < 1 and isrotating == 11:
			beingpressed = true
			prevpos = player.get_pos()
			emit_signal("mattepressryt")
			emit_signal("rightrot")
			player.set_linear_velocity(velocity)
			player.set_angular_velocity(0)
			ctr = 0
			angleinit1 = (player.get_rot())
			player.set_angular_velocity(10)
				
			ctr5 = ctr5+1
			 
		while ctr2 < 1 and isrotating == 10 :
			beingpressed = true
			prevpos = player.get_pos()
			emit_signal("mattepresslft")
			emit_signal("leftrot")
			player.set_linear_velocity(velocity)
			player.set_angular_velocity(0)
			ctr1 = 0
			angleinit2 = (player.get_rot())
			player.set_angular_velocity(-10)
				
			ctr2 = ctr2+1
				 
	
			#set_process_input(false)


func _on_rottimeright_timeout():
	while ctr < 1:
		taploop =0
		
		player.set_pos(Vector2(player.get_pos().x,prevpos.y -310  ))
		isrotating = 0
		# transfer
		player.set_linear_velocity(Vector2(0, 0))
		player.set_angular_velocity(0)
		player.set_rot(angleinit1 +  deg2rad(-120))
		afterrot =angleinit1 + deg2rad(-120)
		emit_signal("tapped")
		ctr = ctr+1
	pass # replace with function body
	
func _on_center_timeout():
	while ctr7 < 1 :
		taploop =0
		
		player.set_pos(Vector2(player.get_pos().x,prevpos.y -310  ))
		player.set_linear_velocity(Vector2(0, 0))
		isrotating = 0
		player.set_angular_velocity(0) 
		afterrot =angleinit1 
		emit_signal("tapped")
		ctr7 = ctr7 + 1
	pass # replace with function body
	
func _on_rottimeleft_timeout():
	while ctr1 < 1:
		
		taploop =0
		player.set_pos(Vector2(player.get_pos().x, prevpos.y -310 ))
		# transefer
		isrotating = 0
		player.set_linear_velocity(Vector2(0, 0))
		player.set_angular_velocity(0)
		player.set_rot(angleinit2 +  deg2rad(120))
		afterrot =angleinit1  + deg2rad( 120)
		afterrot = player.get_rot()
		
		emit_signal("tapped")
		ctr1 = ctr1+1
	

	pass # replace with function body

 

func _on_matteryt_timeout():
	beingpressed = false
	isrotating = 0
	ctr5 = 0
	pass # replace with function body


func _on_mattelf_timeout():
	beingpressed = false
	isrotating = 0
	ctr2 = 0
	pass # replace with function body




func _on_matte_center_timeout():
	beingpressed = false
	ctr6 = 0
	isrotating = 0
	pass # replace with function body
	
func _on_game_timer_timeout():
	timer.set_text("TIME OUTO DESS!!!")
	gameover = true
	PAUSE_MODE_STOP
	#set_process_input(false)
	pass # replace with function body

 
func _input(event):
	
	
	if beingpressed == false:
		 
		if event.is_action_pressed("right"):
			engu = engu+1
			taps = taps+1
			isrotating = 11
			 
		elif event.is_action_pressed("left"): 
			taps = taps+1
			engu = engu-1
			isrotating = 10
		elif event.is_action_pressed("center"): 
			taps = taps+1
			 
			isrotating = 23
		else:
			 
			isrotating = 0
			 
			
	else:
		return


func _on_food_addtime():
	minuslen = minuslen  -(48)
	pass # replace with function body

 

func _on_resetbtn_pressed():
	var runonce = 0
	while runonce < 1:
		emit_signal("reset")
		resetted = true
	runonce = runonce+1
	pass # replace with function body
