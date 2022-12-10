extends Node


export(Array, PackedScene) var weapon_inventory;
var hand : Position3D
var equipped_weapon : Spatial

signal ammo_update;

var current_weapon_index = 0;

func _ready():
	hand = get_parent().find_node("Hand");

	if weapon_inventory[0]:
		equip_weapon(weapon_inventory[0])


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

func sendAmmoInfo():
	if equipped_weapon:
		equipped_weapon.sendAmmoInfo();

func change_weapon(dir: int):
	current_weapon_index = (current_weapon_index + dir) % weapon_inventory.size();
	print("idx: ", current_weapon_index, " ", weapon_inventory.size());
	equip_weapon(weapon_inventory[current_weapon_index]);
	equipped_weapon.sendAmmoInfo();


func on_Gun_ammo_update(current_ammo, max_ammo):
	emit_signal("ammo_update", current_ammo, max_ammo);


