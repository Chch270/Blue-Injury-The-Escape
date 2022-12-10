extends Spatial

onready var attack_delay = $AttackerDelay;
onready var animation_timer = $AnimationTimer;
onready var animation = $AnimationPlayer;
onready var can_deal_damage = $CanDealDamage;

export var millis_between_shots = 1000;
export var damages = 2;

signal update_ammo;

var can_shot = true;
var is_attacking: bool = false;

func shoot():
	if can_shot:
		animation.play("Attack");
		can_shot = false;
		is_attacking = true;
		animation_timer.start();
		can_deal_damage.start();
		

func reload():
	pass;

func sendAmmoInfo():
	emit_signal("update_ammo", "10", "10");


func _on_AttackerDelay_timeout():
	can_shot = true;


func _on_Area_body_entered(body: Node):
	if is_attacking && body.has_node("Stats"):
		var stat_node : Stats = body.find_node("Stats");
		if stat_node.entity_name != "Player":
			stat_node.take_hit(damages);


func _on_AnimationTimer_timeout():
	attack_delay.start();


func _on_CanDealDamage_timeout():
	is_attacking = false;
