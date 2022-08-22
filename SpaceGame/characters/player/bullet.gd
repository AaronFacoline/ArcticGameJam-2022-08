extends KinematicBody2D

var velocity = Vector2(0,1)
var speed = 10

func _ready():
	rotation_degrees = 0;

func _physics_process(delta):
	var collison = move_and_collide(velocity.normalized()*speed)
