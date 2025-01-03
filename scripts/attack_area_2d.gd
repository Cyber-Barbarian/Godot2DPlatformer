extends Area2D

class_name  attack_area_2d

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_attack_area_2d_body_entered(body: Node2D) -> void:
	print("teste" + str(body.get_tree_string()))
	#ass
	#if body.get_child(0).has_node("Enemy") == null:
	#	print("ok")
	#else:
	#	print(body.get_class_name())
	#body.killzone_enemy.set_deferred("monitoring",false)
	#body.animated_sprite_2d.play("die")


func _on_area_entered(area: Area2D) -> void:
	print("teste" + str(area.get_class()))
