extends KinematicBody2D

const bulletPath = preload("res://characters/player/bullet.tscn")
var velocity : Vector2

var moving = false
var destination = Vector2()

var acceleration = 0.4
var deceleration = 0.2
var maxSpeed = 3

var sprite1 = preload("res://assets/player.png")
var sprite2 = preload("res://assets/playermove.png")
onready var mySprite = get_node("Sprite")

func _ready():
	var timer = Timer.new()
	timer.set_wait_time(0.4)
	timer.set_one_shot(false)
	timer.connect("timeout", self, "shoot")
	add_child(timer)
	timer.start()
	

func _unhandled_input(event):
	if(event.is_action_pressed("move")):
		moving = true
		mySprite.set_texture(sprite2)
	if(event.is_action_released("move")):
		moving = false
		mySprite.set_texture(sprite1)

func _physics_process(delta):
	destination = get_global_mouse_position()
	
	if(moving && (position.distance_to(destination) > 5) && velocity.length() < maxSpeed):
		velocity = velocity + (position.direction_to(destination) * acceleration)
	else:
		if(velocity.length() > 0):
			velocity = velocity - (velocity.normalized() * deceleration)
	
	var collision = move_and_collide(velocity)
	if collision:
		get_tree().change_scene("res://StartMenu.tscn")
		queue_free()
	

func _process(delta):
	look_at(get_global_mouse_position())

func shoot():
	if(moving):
		destination = get_global_mouse_position()
		var bullet = bulletPath.instance()
		get_parent().add_child(bullet)
		bullet.position = $Position2D.global_position
		bullet.rotation = $Position2D.global_rotation
		bullet.velocity = (destination - bullet.position)
