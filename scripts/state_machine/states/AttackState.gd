extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	if !player.flipped:
		player.animation_player2.play("right_sword_attack")
	else:
		player.animation_player2.play("left_sword_attack")
	block_other_actions = true
	
	


func physics_update(delta: float) -> void:
	
	player.velocity.y += player.gravity * delta
	player.move_and_slide()
	
	if !block_other_actions:
		if  player.is_on_floor() and Input.is_action_just_pressed("jump"):
			finished.emit(JUMPING)
		elif  player.is_on_floor() and (Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right")):
			finished.emit(RUNNING)
		else :
			finished.emit(IDLE)
	
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	block_other_actions = false
