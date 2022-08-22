extends Node2D

var object = load("res://characters/Enemies/square.tscn")

func _ready():
	randomize()
	var timer = Timer.new()
	timer.set_wait_time(1.7)
	timer.set_one_shot(false)
	timer.connect("timeout", self, "spawn")
	add_child(timer)
	timer.start()
	
func spawn():
		var x = rand_range(0,1280)
		var y = rand_range(0,720)
		var rand_pos = Vector2(x,y)

		var object_instance = object.instance()
		object_instance.position = rand_pos
		add_child(object_instance)
