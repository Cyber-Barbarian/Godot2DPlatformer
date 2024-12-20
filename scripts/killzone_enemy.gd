extends Area2D

@onready var timer: Timer = $Timer
@onready var enemy_slime_green: Node2D = $".."
@onready var killzone_enemy: Area2D = $"."

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		var player = body as CharacterBody2D
		if player.velocity.y > 0: # Ensure the player is moving downward 
			killzone_enemy.set_deferred("monitoring",false)
			
			#enemy_slime_green.queue_free() # Remove the enemy 
			player.velocity.y = -200 # Bounce the player upwards
	else:
		print("You died!")
		#reduzir a escalab de tempo
		Engine.time_scale = 0.5
		body.get_node("CollisionShape2D").set_deferred("disabled",true)
		timer.start()


func _on_timer_timeout() -> void:
	#aumentar novamente a escala de tempo
	Engine.time_scale = 1
	get_tree().reload_current_scene()
