extends Node

class_name Stats

signal you_died_signal
signal health_changed

export var max_hp = 10
var current_hp = max_hp

func _ready():
	pass # Replace with function body.


func take_hit(damage):
	current_hp -= damage;
	emit_signal("health_changed", current_hp)
	print("I'm hit ", current_hp, "/", max_hp)
	
	if current_hp <= 0:
		die()


func die():
	emit_signal("you_died_signal")
