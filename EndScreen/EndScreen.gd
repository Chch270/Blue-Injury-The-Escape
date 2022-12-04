extends Control


onready var score = $MarginContainer/VBoxContainer/GridContainer/ScoreValue;


func _ready():
	score.text = String(GlobalSettings.score);

func _input(event):
	if (event.is_action_pressed("ui_accept")):
		get_tree().change_scene("res://menu.tscn");
