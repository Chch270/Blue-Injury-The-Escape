extends Spatial

export(PackedScene) var Bullet

var sound_direct = preload("res://audio/sound_direct.tscn");
var sound_shooting = preload("res://audio/gun-shot.mp3");
var sound_reload = preload("res://audio/reload.mp3");
var sound_empty_shot = preload("res://audio/empty-gun-shot.mp3");

onready var animationGun = $AnimationPlayer;

onready var rof_time = $ShotDelay
var can_shot = true;

onready var reload_time = $ReloadDelay
var is_reloading = false;

export var muzzle_speed = 30;
export var millis_between_shots = 200;

signal update_ammo;

export var mag_capacity = 30;
var nb_ammo = mag_capacity;

func _ready():
	nb_ammo = mag_capacity;
	rof_time.wait_time = millis_between_shots / 1000.0;
	reload_time.wait_time = 2;


func shoot():
	if can_shot && nb_ammo > 0 && is_reloading == false:
		var new_bullet = Bullet.instance();
		new_bullet.global_transform = $Muzzle.global_transform;
		new_bullet.speed = muzzle_speed;
		var scene_root = get_tree().get_root().get_children()[0];
		scene_root.add_child(new_bullet);
		can_shot = false;
		rof_time.start();
		nb_ammo -= 1;
		emit_signal("update_ammo", nb_ammo, mag_capacity);
		animationGun.play("Fire");
		var sound = sound_direct.instance();
		add_child(sound);
		sound.play_sound(sound_shooting);
	elif can_shot && is_reloading == false:
		can_shot = false;
		rof_time.start();
		var sound = sound_direct.instance();
		add_child(sound);
		sound.play_sound(sound_empty_shot);

func reload():
	if nb_ammo < mag_capacity:
		nb_ammo = mag_capacity;
		is_reloading = true;
		reload_time.start()
		animationGun.play("Reload");
		var sound = sound_direct.instance();
		add_child(sound);
		sound.play_sound(sound_reload);
		sendAmmoInfo();

func sendAmmoInfo():
	emit_signal("update_ammo", nb_ammo, mag_capacity);

func _on_ShotDelay_timeout():
	can_shot = true;


func _on_ReloadDelay_timeout():
	is_reloading = false;
