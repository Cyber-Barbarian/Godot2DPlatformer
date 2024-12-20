extends Area2D

@onready var hud: CanvasLayer = %HUD
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	hud.add_points()
	collision_shape_2d.set_deferred("disabled", true)
	animated_sprite_2d.set_deferred("visible",false)
	audio_stream_player_2d.playing = true
	timer.start()
	
func _on_timer_timeout() -> void:
	queue_free()
