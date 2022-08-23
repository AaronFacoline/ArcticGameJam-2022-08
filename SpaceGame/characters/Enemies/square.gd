extends KinematicBody2D

const projectilePath = preload("res://characters/Enemies/projectile.tscn")

var destination = Vector2()
var speed = 1.4
#onready var collision = $CollisionPolygon2D

func _ready():
	var timer = Timer.new()
	timer.set_wait_time(1.0)
	timer.set_one_shot(false)
	timer.connect("timeout", self, "shoot")
	add_child(timer)
	timer.start()
	

func _process(delta):
	rotate(0.015)
	
func _physics_process(delta):
	destination = get_parent().get_node("Player").position
	var collision = move_and_collide(position.direction_to(destination) * speed)
	if collision:
		queue_free()
	
func shoot():
	var projectileNorth = projectilePath.instance()
	get_parent().add_child(projectileNorth)
	projectileNorth.position = $North.global_position
	projectileNorth.velocity = (projectileNorth.position - $Centre.global_position)
	
	var projectileSouth = projectilePath.instance()
	get_parent().add_child(projectileSouth)
	projectileSouth.position = $South.global_position
	projectileSouth.velocity = (projectileSouth.position - $Centre.global_position)
	
	var projectileEast = projectilePath.instance()
	get_parent().add_child(projectileEast)
	projectileEast.position = $East.global_position
	projectileEast.velocity = (projectileEast.position - $Centre.global_position)
	
	var projectileWest = projectilePath.instance()
	get_parent().add_child(projectileWest)
	projectileWest.position = $West.global_position
	projectileWest.velocity = (projectileWest.position - $Centre.global_position)
