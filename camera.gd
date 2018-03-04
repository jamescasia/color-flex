extends Camera2D
onready var player = get_node("../").get_node("Node2D/player") 
onready var food = get_node("../food")
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_fixed_process(true)
	# Called every time the node is added to the scene.
	# Initialization here
	pass
func _fixed_process(delta):
 
	set_pos(Vector2(player.get_pos().x, player.get_pos().y-75))
