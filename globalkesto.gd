extends Node
var time
#var adctr =  classichigh.get("adctr")
var adctr = 0
var runonce = 0
var runonce1 = 0
var runonce2 = 0
var runonce3 = 0
var dontpreload
var adctrr = 0 
var adctre = 0 
var classicpressed
var endlesspressed
var rushpressed
var timeplayed
var timepassed
var haha1 = loadhaha()

var time_start = 0
var time_now = 0

 
 


func _ready():
	
	#bgmusic.set_stream("track.ogg")
	#bgmusic.play(0)
	
	
	Globals.set("classicpressed", int(loadclassic())  ) 
	
	time_start = OS.get_unix_time() 
	Globals.set("timepassed", 0)
	Globals.set("timepassed1", 0)
	Globals.set("adresetc", 0)
	Globals.set("adwtwt", int(loadadwt()))
	Globals.set("adresetr", 0)
	Globals.set("adresete", 0)
	Globals.set("finish", int(loadhaha()))
	set_fixed_process(true)
	pass
func _fixed_process(delta): 
	haha1 = int(loadhaha())
	print(str(Globals.get("classicpressed")))
	#Globals.set("classicpressed", int(loadclassic()))
	 
	saveclassic(str(Globals.get("classicpressed"))) 
	
	
	
	
	#runonce = Globals.get("adctr")
	
	if Globals.get("haha1") == 1:
		while runonce3 < 1:
			
			haha1 = haha1 + 1
			runonce3 = runonce3 + 1
	if Globals.get("haha1") == 0:
			runonce3 = 0
			
			
			
	if Globals.get("adctr") == 1:
		while runonce < 1:
			
			adctr = adctr + 1
			Globals.set("adwtwt",int(loadadwt()) + 1)
			
			runonce = runonce + 1
	if Globals.get("adctr") == 0:
			runonce = 0
			
			
			
			
	if Globals.get("adctrrush") == 1:
		while runonce1 < 1:
			
			adctrr = adctrr + 1
			runonce1 = runonce1 + 1
	if Globals.get("adctrrush") == 0:
			runonce1 = 0
	
	
	if Globals.get("adctrendless") == 1:
		while runonce2 < 1:
			
			adctre = adctre + 1
			runonce2 = runonce2 + 1
	if Globals.get("adctrendless") == 0:
			runonce2 = 0
			
	time_now = OS.get_unix_time()
	var elapsed = time_now - time_start
	var minutes = elapsed / 60
	var minutes1 = elapsed / 30
	var seconds = elapsed % 60
	var str_elapsed = "%02d : %02d" % [minutes, seconds]
	saveadwt(str(Globals.get("adwtwt")))
	
	Globals.set("timepassed", minutes)
	Globals.set("timepassed1", minutes1)
	print("elapsed : ", str_elapsed)
	
	print(time)
	print(Globals.get("finish"))
	Globals.set("finish", haha1)
	save(str(Globals.get("finish")))
	Globals.set("adresetc", adctr)
	Globals.set("adresetr", adctrr)
	Globals.set("adwtwt", int(loadadwt()))
	Globals.set("adresete", adctre)
	
func save(content):
    var file = File.new()
    file.open("user://haha_game.dat", file.WRITE)
    file.store_string(content)
    file.close()

func loadhaha():
	var file = File.new()
	file.open("user://haha_game.dat", file.READ)
	var content = file.get_as_text()
	file.close()
	return content


func saveclassic(content):
    var file = File.new()
    file.open("user://classicctr.dat", file.WRITE)
    file.store_string(content)
    file.close()


func loadclassic():
	var file = File.new()
	file.open("user://classicctr.dat", file.READ)
	var content = file.get_as_text()
	file.close()
	return content



 




func _on_Node_classicpressed():
	Globals.set("classicpressed", int(Globals.get("classicpressed")) + 1)
	pass # replace with function body
 

 
func saveadwt(content):
	var file = File.new()
	file.open("user://saveadwt_game.dat", file.WRITE)
	file.store_string(content)
	file.close()
	
func loadadwt():
	var file = File.new()
	file.open("user://saveadwt_game.dat", file.READ)
	var content = file.get_as_text()
	file.close()
	return content