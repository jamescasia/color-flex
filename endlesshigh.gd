extends Node
onready var main = get_node("../")

var adctr = 0
func _ready():
	Globals.set("adctr", 0)
	Globals.set("adctrendless", 0)
	set_fixed_process(true)
	
	pass
	
func _on_Node_adctr():
	 
	Globals.set("adctr", Globals.get("adctr") + 1)
	Globals.set("adctrrush", Globals.get("adctrrush") + 1)
	Globals.set("adctrendless", Globals.get("adctrendless") + 1)
	pass # replace with function body
