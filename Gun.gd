extends Spatial

export(PackedScene) var Bullet

onready var rof_time = $Timer
var can_shot = true;

export var muzzle_speed = 30;
export var millis_between_shots = 100;

var nb_ammo = 30;

var max_ammo = 30;

func _ready():
	rof_time.wait_time = millis_between_shots / 1000.0;


func _process(delta):
	pass

func shoot():
	if can_shot && nb_ammo > 0:
		var new_bullet = Bullet.instance();
		new_bullet.global_transform = $Muzzle.global_transform;
		new_bullet.speed = muzzle_speed;
		var scene_root = get_tree().get_root().get_children()[0];
		scene_root.add_child(new_bullet);
		can_shot = false;
		rof_time.start();
		nb_ammo -= 1;

func reload(var ammo):
	nb_ammo += ammo;
	if (nb_ammo > max_ammo):
		nb_ammo = max_ammo;

func _on_Timer_timeout():
	can_shot = true;
