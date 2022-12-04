extends Node


export(PackedScene) var Weapon
var hand : Position3D
var equipped_weapon : Spatial

signal ammo_update;


func _ready():
	hand = get_parent().find_node("Hand");

	if Weapon:
		equip_weapon(Weapon)


func equip_weapon(weapon_to_equip):
	if equipped_weapon:
		print("delete current weapon");
		equipped_weapon.queue_free();
	print("no weapon equipped");
	equipped_weapon = weapon_to_equip.instance();
	hand.add_child(equipped_weapon);
	equipped_weapon.connect("update_ammo", self, "on_Gun_ammo_update")


func shoot():
	if equipped_weapon:
		equipped_weapon.shoot();

func reload():
	if equipped_weapon:
		equipped_weapon.reload();


func on_Gun_ammo_update(current_ammo, max_ammo):
	emit_signal("ammo_update", current_ammo, max_ammo);


