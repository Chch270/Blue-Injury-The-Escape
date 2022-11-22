extends Node

class_name Stats

export var max_hp = 10

onready var current_hp = max_hp

signal you_died_signal

func _ready():
	pass # Replace with function body.


func take_hit(damage):
	current_hp -= damage;
	print("I'm hit ", current_hp, "/", max_hp)
	
	if current_hp <= 0:
		die()


func die():
	emit_signal("you_died_signal")
