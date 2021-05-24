extends Node2D

export(PackedScene) var bullet
onready var bullet_nodes = get_parent().get_parent().get_parent().get_node("Bullets")

#misc variables
var cooldown = false
var target_rot
var swing = false

func _physics_process(delta: float) -> void:
	if Input.is_mouse_button_pressed(1) and cooldown == false:
		cooldown = true
		var mouse_pos = get_global_mouse_position()
		var b = bullet.instance()
		bullet_nodes.add_child(b)
		b.global_position = global_position
		b.target_pos = mouse_pos
		b.init()
		swing()
		$Cooldown.start()
	if swing and cooldown:
		rotation_degrees = lerp(rotation_degrees, target_rot, 0.1)

func swing():
	get_parent().rotateable = false
	if get_parent().facing == "R":
		target_rot = int(rotation_degrees - 60)
		rotation_degrees = int(rotation_degrees + 60)
	else:
		target_rot = int(rotation_degrees + 60)
		rotation_degrees = int(rotation_degrees - 60)
	swing = true

func _on_Cooldown_timeout() -> void:
	cooldown = false
	swing = false
	get_parent().rotateable = true
	rotation_degrees = 0
