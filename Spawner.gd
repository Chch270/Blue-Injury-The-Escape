extends Spatial

export(PackedScene) var Enemy
onready var timer = $Timer

var waves;
var current_wave : Wave;
var wave_number = 0;

var enemies_remaining_to_spawn;
var enemies_killed_this_wave;

signal new_wave;
signal enemy_killed;

func _ready():
	waves = $Waves.get_children()

func start_next_wave():
	enemies_killed_this_wave = 0;
	wave_number += 1;
	if wave_number > waves.size():
		return
	current_wave = waves[wave_number - 1];
	enemies_remaining_to_spawn = current_wave.nb_enemies;
	timer.wait_time = current_wave.seconds_between_spawns;
	emit_signal("new_wave", wave_number);
	emit_signal("enemy_killed", current_wave.nb_enemies, current_wave.nb_enemies, 0);
	timer.start();


func connect_to_enemy_signal(enemy : Enemy):
	var stats : Stats = enemy.get_node("Stats");
	stats.connect("you_died_signal", self, "_on_Enemy_Stats_you_died_signal");


func _on_Enemy_Stats_you_died_signal(give_score):
	print("Enemy died");
	enemies_killed_this_wave += 1;
	emit_signal("enemy_killed", current_wave.nb_enemies - enemies_killed_this_wave, current_wave.nb_enemies, give_score);


func _on_Timer_timeout():
	if enemies_remaining_to_spawn:
		var enemy = Enemy.instance();
		enemy.speed += wave_number;
		connect_to_enemy_signal(enemy);
		get_parent().add_child(enemy);
		enemies_remaining_to_spawn -= 1;
	elif enemies_killed_this_wave == current_wave.nb_enemies && wave_number < waves.size():
		start_next_wave();
