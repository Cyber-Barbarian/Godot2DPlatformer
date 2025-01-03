extends Sprite2D

var blue_value:float = 1.0
var time:float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += 0.01
	if time >= 1:
		time = 0
	material.set_shader_parameter("blue_value", time)
