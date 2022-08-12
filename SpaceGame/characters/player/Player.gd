extends KinematicBody2D

var inputVector : Vector2
var velocity : Vector2

var moving = false
var destination = Vector2()

export (int) var acceleration = 200

func _unhandled_input(event):
	if(event.is_action_pressed("move")):
		moving = true
		destination = get_global_mouse_position()
	if(event.is_action_released("move")):
		moving = false
func _physics_process(delta):
	if(moving):
		velocity = position.direction_to(get_global_mouse_position()) * acceleration
	else:
		velocity = velocity * 0
	
	move_and_slide(velocity)


func _process(delta):
	look_at(get_global_mouse_position())
