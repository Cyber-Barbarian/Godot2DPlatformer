extends PlayerState


func enter(previous_state_path: String, data := {}) -> void:
	player.velocity.x = 0.0
	#player.animation_player.play("idle")
	#player.get_node("../../AnimatedSprite2D").play("idle")
	#player.animated_sprite_2d.play("idle")
	player.animation_player.play("idle")


func physics_update(_delta: float) -> void:
	player.velocity.y += player.gravity * _delta
	player.move_and_slide()

	#if not player.is_on_floor():
	#	finished.emit(FALLING)
	#elif 
	if  player.is_on_floor() and Input.is_action_just_pressed("jump"):
		finished.emit(JUMPING)
	elif Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		finished.emit(RUNNING)
