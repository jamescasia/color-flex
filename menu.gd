extends Control
var adctr

#var chooserscn = preload("res://chooser.tscn").instance() 
var selecting  

onready var playbtn1 = get_node("playbtn1")
onready var playbtn2 = get_node("playbtn2") 
onready var Camera = get_node("Camera2D") 
onready var playbtn = get_node("playbtn")
var quit = 0
onready var playbtn3 = get_node("playbtn3")
onready var playbtnbtn = get_node("playbtn/play")
onready var out = get_node("getout") 
onready var Sampleplayer = get_node("SamplePlayer")
onready var butones = get_node("Node2D/buttons") 
onready var sfx = get_node("Node2D/title/mute") 
signal classicpressed 

var mainscn = preload("res://main.tscn")
var rashscn = preload("res://rash.tscn")
var endlessscn = preload("res://endless.tscn")
var statscn = preload("res://store.tscn")
var mutebg = preload("res://fxoff.png") 
var mutefx = preload("res://bgoff.png") 
var fxon = preload("res://bgon.png") 
var bgon = preload("res://fxon.png") 
var menuscn = preload("res://menu.tscn")
func _ready():      
	

		
	butones.set_hidden(false)
	selecting = false
	get_node("screenbtn").set_hidden(true)
	set_process_input(true) 
	#playbtn1.set_hidden(true)
	#playbtn2.set_hidden(true)
	#playbtn3.set_hidden(true)
	playbtn.set_hidden(false)
	playbtnbtn.set_hidden(false)
	 
	get_node("classicbtn").set_hidden(true) 
	get_node("endlessbtn").set_hidden(true)
	get_node("rushbtn").set_hidden(true) 
	
	get_node("Node2D").set_pos(Vector2(0,0)) 
	 
	get_tree().set_auto_accept_quit(true)
	set_fixed_process(true) 
	
	
	

 
func _on_play_pressed():  
	selecting = true
	get_node("screenbtn").set_hidden(false)
	get_node("classicbtn").set_hidden(false)
	get_node("endlessbtn").set_hidden(false)
	get_node("rushbtn").set_hidden(false)
			#get_node("playbtn/play").set_hidden(true)
	out.play_backwards("New Anim") 
	#Sampleplayer.play("navigation")
	#get_tree().change_scene("res://chooser.tscn")
	
	pass # replace with function body

 

 
func _fixed_process(delta):    
	if get_node("quitting").is_playing() == true and quit >=2:
		get_tree().quit()
		
		

	get_tree().set_auto_accept_quit(false)
	

	if AudioServer.get_stream_global_volume_scale() == 0:
		sfx.get_node("red").set_texture(mutebg)
		
	else:
		
		sfx.get_node("red").set_texture(bgon)
	if AudioServer.get_fx_global_volume_scale() == 0:
		sfx.get_node("ye").set_texture(mutefx)
		
	else:
		
		sfx.get_node("ye").set_texture(fxon)
	print(Globals.get("dontpreload"))
	if get_node("classicbtn").is_hidden():
		selecting = false
		
		
	save(str(Globals.get("adresetc")))
 
 
func save(content):
    var file = File.new()
    file.open("user://ctr_game.dat", file.WRITE)
    file.store_string(content)
    file.close()

func _on_review_pressed():
	Sampleplayer.play("navigation")
	savereview("reviewed")
	
	OS.shell_open("https://play.google.com/store/apps/details?id=org.aetherapps.colorflex&hl=en") 
	
	pass # replace with function body


func _on_stats_pressed():
	Sampleplayer.play("navigation")
	get_tree().change_scene("res://store.tscn")
	pass # replace with function body


 
	#get_node("Node2D").set_pos(Vector2(1500, 1500))
	


func _on_classicbtn_pressed(): 
	emit_signal("classicpressed")
	
	get_tree().change_scene("res://main.tscn")
		 

func _on_endlessbtn_pressed():
	emit_signal("classicpressed")
	
	get_tree().change_scene("res://endless.tscn")
 

func _on_rushbtn_pressed():
	emit_signal("classicpressed")
	
	get_tree().change_scene("res://rash.tscn")
	 
	
 
 


func _on_screenbtn_pressed():  
	var runonce = 0
	while runonce <1:
		get_node("classicbtn").set_hidden(true) 
		get_node("endlessbtn").set_hidden(true)
		get_node("rushbtn").set_hidden(true) 
		if selecting == true:
			butones.set_hidden(false)
			out.play("New Anim")
			
			runonce +=1
		if selecting == false:
			return 
	pass # replace with function body


 

func _on_aetherweb_pressed():
	Sampleplayer.play("navigation")
	OS.shell_open("http://aetherapps.xyz/")
	pass # replace with function body


func _on_aetherpage_pressed():
	Sampleplayer.play("navigation")
	OS.shell_open("https://facebook.com/profile.php?id=318028921986867")
	pass # replace with function body


func _on_sharegame_pressed():
		OS.shell_open("https://www.facebook.com/sharer/sharer.php?u=https%3A//www.facebook.com/aetherapps/")
	
		Sampleplayer.play("navigation") 



 

func _on_mutesfx_pressed():
	#if sfx.get_node("ye").get_texture() != mutefx:
		
	#else:
		
		
	 
	if AudioServer.get_fx_global_volume_scale() == 0:
		sfx.get_node("ye").set_texture(fxon)
		
		AudioServer.set_fx_global_volume_scale(1)
	else:
		AudioServer.set_fx_global_volume_scale(0)
		
		sfx.get_node("ye").set_texture(mutefx)
		
	pass # replace with function body


func _on_mutebg_pressed():
	#if sfx.get_node("red").get_texture() != mutebg:
		
	#else:
		 
	if AudioServer.get_stream_global_volume_scale() == 0:
		sfx.get_node("red").set_texture(bgon)
		AudioServer.set_stream_global_volume_scale(1)
		
	else:
		AudioServer.set_stream_global_volume_scale(0)
		
		sfx.get_node("red").set_texture(mutebg)
	pass # replace with function body 
func savereview(content):
	var file = File.new()
	file.open("user://save_review.dat", file.WRITE)
	file.store_string(content)
	file.close()
 

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST: 
		get_node("quitting").play("New Anim")
		quit+=1
	var runonce = 0
 
	 


func _on_quitting_finished():
	var runonce = 0
	while runonce < 1:
		quit = 0
		runonce +=1
	pass # replace with function body
