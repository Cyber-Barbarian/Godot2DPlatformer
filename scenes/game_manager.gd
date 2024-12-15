extends Node

@onready var score: Label = $Score;

var score_points = 0;

func add_point():
	score_points +=1;
	score.text  = "Pontos: " + str(score_points)
