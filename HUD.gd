extends Control


onready var ammo = $GridContainer/AmmoValue;
onready var enemies_left = $GridContainer/MobValue;
onready var score = $GridContainer2/ScoreValue;

var current_score = 0;

func _ready():
	GlobalSettings.score = 0;


func _on_Spawner_enemy_killed(nb_enemies_left, total_enemies, give_score):
	enemies_left.text = String(nb_enemies_left) + "/" + String(total_enemies);
	current_score += give_score;
	GlobalSettings.score = current_score;
	score.text = String(current_score);


func _on_GunControler_ammo_update(current_ammo, max_ammo):
	ammo.text = String(current_ammo) + "/" + String(max_ammo);
