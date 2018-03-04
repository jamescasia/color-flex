extends StreamPlayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var songer = preload("res://track.ogg")
func _ready():
	set_stream(songer)
	play()
	set_loop(true)
	set_volume_db(21)