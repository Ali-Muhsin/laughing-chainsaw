extends KinematicBody2D

onready var _animation_player = $AnimationPlayer

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		_animation_player.play("walk")
	else:
		_animation_player.stop()
