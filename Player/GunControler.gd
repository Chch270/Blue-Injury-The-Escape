extends Node


export(PackedScene) var Weapon
var hand : Position3D
var equipped_weapon : Spatial

func _ready():
	hand = get_parent().find_node("Hand");

	if Weapon:
		equip_weapon(Weapon)



func equip_weapon(weapon_to_equip):
	if equipped_weapon:
		print("delete current weapon");
		equipped_weapon.queue_free();
	else:
		print("no weapon equipped");
		equipped_weapon = weapon_to_equip.instance();
		hand.add_child(equipped_weapon);


func shoot():
	if equipped_weapon:
		equipped_weapon.shoot();

func reload(var nb_ammo):
	equipped_weapon.reload(nb_ammo);
