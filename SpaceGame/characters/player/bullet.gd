extends KinematicBody2D

var velocity = Vector2(0,1)
var speed = 500

func _ready():
	rotation_degrees = 0;
	var timer = Timer.new()
	timer.set_wait_time(3)
	timer.set_one_shot(false)
	timer.connect("timeout", self, "queue_free")
	add_child(timer)
	timer.start()

func _physics_process(delta):
	var collision = move_and_slide(velocity.normalized()*speed)
