extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var main = get_node("../")
#onready var food = get_node("../food")
var scoreclassic
func _ready():
	# Called every time the node is added to the scene.
	set_fixed_process(true)
		# Initialization here
	pass
func _fixed_process(delta):
	scoreclassic =  main.get("currentscore")
	#scoreclassic = 12
	#scoreclassic = main.get("currentscore")
	pass

func _on_food_scorechanged(score):
	#
	
	pass # replace with function body
