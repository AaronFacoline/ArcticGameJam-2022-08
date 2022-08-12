extends KinematicBody2D

var velocity : Vector2

var moving = false
var destination = Vector2()

var acceleration = 5
var deceleration = 2
var maxSpeed = 250


func _unhandled_input(event):
	if(event.is_action_pressed("move")):
		moving = true
	if(event.is_action_released("move")):
		moving = false

func _physics_process(delta):
	destination = get_global_mouse_position()
	
	if(moving && (position.distance_to(destination) > 5) && velocity.length() < maxSpeed):
		velocity = velocity + (position.direction_to(destination) * acceleration)
	else:
		if(velocity.length() > 0):
			velocity = velocity - (velocity.normalized() * deceleration)
	
	move_and_slide(velocity)

func _process(delta):
	look_at(get_global_mouse_position())
