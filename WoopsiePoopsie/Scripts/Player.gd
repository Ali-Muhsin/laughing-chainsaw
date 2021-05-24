extends KinematicBody2D

onready var sprite = get_node("AnimatedSprite")
onready var bullet_node = get_parent().get_node("Bullets")

export var speed = 300 #speed of player
export var friction = 0.3 #how fast player will stop
export var acc = 0.1 #how fast player will accellerate

var facing = "R" ##Current facing position of player
var holding = true ##If player is holding

var vel = Vector2()
var dir = Vector2()
var moving = false


func _physics_process(delta):
	dir = Vector2()
	
	if Input.is_action_pressed("down"): #Check for input
		dir.y += 1
	if Input.is_action_pressed("up"):
		dir.y += -1
	if Input.is_action_pressed("right"):
		dir.x += 1
	if Input.is_action_pressed("left"):
		dir.x += -1
	
	if dir == Vector2(): #If not moving, decellerate. Else, accelerate
		moving = false
		vel.x = lerp(vel.x, 0, friction)
		vel.y = lerp(vel.y, 0, friction)
		if holding == true:
			sprite.play("idle_hold")
		else:
			sprite.play("idle")
	else:
		moving = true
		vel.x = lerp(vel.x, dir.x*speed, friction)
		vel.y = lerp(vel.y, dir.y*speed, friction)
		if holding == true:
			sprite.play("run_hold")
		else:
			sprite.play("run")
	
	var mouse_pos = get_global_mouse_position()
	
	if mouse_pos.x > global_position.x:
		sprite.flip_h = false
		facing = "R"
	else:
		sprite.flip_h = true
		facing = "L"
	
	move_and_collide(vel*delta)
	 
