extends KinematicBody2D

var velocity = Vector2()
var speed = 3

func _ready():
	var timer = Timer.new()
	timer.set_wait_time(5)
	timer.set_one_shot(false)
	timer.connect("timeout", self, "queue_free")
	add_child(timer)
	timer.start()

func _physics_process(delta):
	var collision = move_and_collide(velocity.normalized()*speed)
	if collision:
		queue_free()
