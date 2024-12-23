extends Node
signal spacebar_pressed


func _ready():
	pass
	#connect("spacebar_pressed", self, "_on_spacebar_pressed")

func _on_spacebar_pressed():
	print("Spacebar was pressed!")

func _input(event):
	if Input.is_action_just_pressed("jump"):
		emit_signal("spacebar_pressed")
