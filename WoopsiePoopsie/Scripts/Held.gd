extends Node2D

onready var player = get_parent()
onready var facing = get_parent().facing
var rotateable = true

func _physics_process(delta: float) -> void:
	if rotateable:
		look_at(get_global_mouse_position())
	if player.facing == "R":
		position.x = 13
	elif player.facing == "L":
		position.x = -9
