extends Control


onready var coinget = get_node("coinget") 
onready var value = get_node("Node2D/value")
onready var classic = get_node("Node2D/classic") 
onready var rush = get_node("Node2D/rush")
var avg = str(_load())
 
onready var endless = get_node("Node2D/endless")
func _ready():
	set_process_input(true)
	get_node("infoo").set_hidden(true)
	get_node("Sprite 4").set_hidden(true) 
	get_tree().set_auto_accept_quit(false)
	set_fixed_process(true)
	
	
	#if avg.length() <= 3 and avg.length() >= 2 :
	
		#value.set_text(avg + "0")
	if float(avg) == 0:
		value.set_text("0.00")
	 
	elif avg.length() ==1:
		value.set_text(avg + ".00")
	elif avg.length() ==2:
		value.set_text(avg + "00")
	elif avg.length() ==3:
		value.set_text(avg + "0")
	elif avg.length() ==4:
		value.set_text(avg  )
	else:
		value.set_text(avg  )
		
		
		

	


func _fixed_process(delta):
	get_tree().set_auto_accept_quit(false)
	if int(_loadc()) <=9:
		classic.set_text("0"+str(_loadc()))
	elif int(_loadc()) >9:
		classic.set_text(str(_loadc()))
	if int(_loadc()) == 0:
		classic.set_text("00")
	if int(_loadr()) <=9:
		rush.set_text("0"+str(_loadr()))
	if int(_loadr()) == 0:
		rush.set_text("00")
	elif int(_loadr()) >9:
		rush.set_text(str(_loadr()))
	if int(_loade()) <=9:
		endless.set_text("0"+str(_loade())) 
	if int(_loade()) == 0:
		endless.set_text("00")
	elif int(_loade()) >9:
		endless.set_text(str(_loade())) 
	if int(_loade()) <=99:
		endless.set_pos(Vector2(348,576))
	elif int(_loade()) >=100:
		endless.set_pos(Vector2(310,576))
	pass
func _load():
    var file = File.new()
    file.open("user://saveavg_game.dat", file.READ)
    var content = file.get_as_text()
    file.close()
    return content
func _load1():
    var file = File.new()
    file.open("user://ctr_game.dat", file.READ)
    var content = file.get_as_text()
    file.close()
    return content
 
 
func _loadr():
    var file = File.new()
    file.open("user://save1_game.dat", file.READ)
    var content = file.get_as_text()
    file.close()
    return content
func _loadc():
    var file = File.new()
    file.open("user://save_game.dat", file.READ)
    var content = file.get_as_text()
    file.close()
    return content
func _loade():
	var file = File.new()
	file.open("user://save2_game.dat", file.READ)
	var content = file.get_as_text()
	file.close()
	return content 

func _on_infbtn_pressed():
	get_node("infoo").set_hidden(false)
	get_node("Sprite 4").set_hidden(false)
	
	pass # replace with function body
func _input(event):
	if event.type == InputEvent.SCREEN_TOUCH and event.pressed:
		get_node("infoo").set_hidden(true)
		get_node("Sprite 4").set_hidden(true)
		
	
 

func _on_Button1_pressed():
	get_tree().change_scene("res://rash.tscn")
	
	pass # replace with function body


func _on_Button2_pressed():
	get_tree().change_scene("res://endless.tscn")
		
	pass # replace with function body


func _on_classss_pressed():
	get_tree().change_scene("res://main.tscn")
	
func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST: 
		get_tree().change_scene("res://menu.tscn")