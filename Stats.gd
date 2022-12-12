extends Node

class_name Stats

signal you_died_signal
signal health_changed

export var give_score = 10
export var entity_name = "None";

export var max_hp = 10
var current_hp = max_hp

var dead: bool = false;
onready var blood : Particles = $"../Blood"

func _ready():
	current_hp = max_hp


func take_hit(damage):
	current_hp -= damage;
	emit_signal("health_changed", current_hp)
	print("I'm hit ", current_hp, "/", max_hp)
	blood.emitting = true
	$Damage.play()
	if current_hp <= 0 && !dead:
		die()


func die():
	dead = true;
	emit_signal("you_died_signal", give_score)
