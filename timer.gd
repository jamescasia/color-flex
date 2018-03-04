extends Timer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_wait_time(30.2)
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Node_start():
	#get_time_left() + 3
	
	
	start()
	pass # replace with function body


func _on_food_addtime():
	if get_time_left() != 30.2:
		set_wait_time(get_time_left() + 3.2)
	else:
		set_wait_time(40.2)
	start()	
	
	#time_left() = get_time_left() + 3
	
	  

func _on_Node_add10s():
	set_wait_time(get_time_left() + 10.0)
	start()
	pass # replace with function body


 
	pass # replace with function body
