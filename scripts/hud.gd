extends CanvasLayer

@onready var score: Label = $Score

var score_points = 0;

func _ready() -> void:
	score.text = "Pontos: " + str(score_points)

func add_points():
	score_points += 1;
	score.text = "Pontos: " + str(score_points)
	
	
