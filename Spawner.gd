extends Spatial

export(PackedScene) var Enemy
onready var timer = $Timer

var waves;
var current_wave : Wave;
var wave_number = 0;

var enemies_remaining_to_spawn;
var enemies_killed_this_wave;

func _ready():
	waves = $Waves.get_children()
	start_next_wave();

func start_next_wave():
	enemies_killed_this_wave = 0;
	wave_number += 1;
	if wave_number > waves.size():
		return
	current_wave = waves[wave_number - 1];
	enemies_remaining_to_spawn = current_wave.nb_enemies;
	timer.wait_time = current_wave.seconds_between_spawns;
	timer.start();


func connect_to_enemy_signal(enemy : Enemy):
	var stats : Stats = enemy.get_node("Stats");
	stats.connect("you_died_signal", self, "_on_Enemy_Stats_you_died_signal");


func _on_Enemy_Stats_you_died_signal():
	print("Enemy died");
	enemies_killed_this_wave += 1;


func _on_Timer_timeout():
	if enemies_remaining_to_spawn:
		var enemy = Enemy.instance();
		connect_to_enemy_signal(enemy);
		get_parent().add_child(enemy);
		enemies_remaining_to_spawn -= 1;
	elif enemies_killed_this_wave == current_wave.nb_enemies && wave_number < waves.size():
		start_next_wave();
