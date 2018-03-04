extends Node
onready var main = get_node("../")
var haha1 = 0
var adctr = 0
onready var root = get_tree().get_root()
onready var basesize = root.get_rect().size
func _ready():
	Globals.set("haha1", 0)
	Globals.set("adctr", 0)
	set_fixed_process(true)
	
	pass
func _fixed_process(delta): 
	print(basesize)


	pass
func _on_Node_adctr():
	
	
	Globals.set("adctr", Globals.get("adctr") + 1)
	Globals.set("adctrrush", Globals.get("adctrrush") + 1)
	Globals.set("adctrendless", Globals.get("adctrendless") + 1)
		 
	pass # replace with function body


func _on_Node_finished1():
	var runonce = 0
	while runonce < 1:
		Globals.set("timepassed", 0)
		runonce = runonce + 1
	 
func _on_Node_finished2():
	var runonce = 0
	while runonce < 1:
		Globals.set("timepassed1", 0)
		runonce = runonce + 1
	pass # replace with function body


func _on_Node_haha():
 
	Globals.set("haha1", Globals.get("haha1") + 1)
		 
