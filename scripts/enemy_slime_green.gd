extends Node2D

const enemy = true
var speed = 60
var direction = 1
@onready var ray_cast_2_ddireita: RayCast2D = $RayCast2Ddireita
@onready var ray_cast_2_desquerda: RayCast2D = $RayCast2Desquerda
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var killzone_enemy: Area2D = $Killzone_enemy
@onready var timer: Timer = $Timer




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_between_walls(delta)
	
func move_between_walls(delta: float) -> void:
	if ray_cast_2_ddireita.is_colliding() || ray_cast_2_desquerda.is_colliding():
		animated_sprite_2d.flip_h = !animated_sprite_2d.flip_h
		direction = -1 * direction
	position.x += direction * speed * delta
	


func _on_killzone_enemy_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		var player = body as CharacterBody2D
		if player.velocity.y > 0: # Ensure the player is moving downward 
			killzone_enemy.set_deferred("monitoring",false)
			animated_sprite_2d.play("die")
			#enemy_slime_green.queue_free() # Remove the enemy 
			player.velocity.y = -200 # Bounce the player upwards
			speed = 0
			timer.start()
		else:
			print("You died!")
			#reduzir a escalab de tempo
			#Engine.time_scale = 0.5
			body.get_node("CollisionShape2D").set_deferred("disabled",true)
			#timer.start()



func _on_timer_timeout() -> void:
	queue_free()
