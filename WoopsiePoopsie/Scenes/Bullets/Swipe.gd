extends Area2D

export var timeout = .2
export var target_pos = Vector2() ##Global position of mouse click
export var speed = 10

func _ready():
	set_physics_process(false)

func init():
	$Timer.wait_time = timeout
	$Timer.start()
	look_at(target_pos)
	set_physics_process(true)

func _physics_process(delta: float) -> void:
	global_position += Vector2(1, 0).rotated(rotation) * speed

func _on_Timer_timeout() -> void:
	queue_free()
