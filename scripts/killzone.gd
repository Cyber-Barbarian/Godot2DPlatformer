extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	print("You died!")
	#reduzir a escalab de tempo
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").set_deferred("disabled",true)
	timer.start()


func _on_timer_timeout() -> void:
	#aumentar novamente a escala de tempo
	Engine.time_scale = 1
	get_tree().reload_current_scene()
