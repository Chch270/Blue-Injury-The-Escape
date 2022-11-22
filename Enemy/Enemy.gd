extends KinematicBody

class_name Enemy

onready var player : Node = $"../Player"

onready var attack_timer = $AttackTimer;

var attack_speed_multiplier = 2;

var attack_target: Vector3;
var return_target: Vector3;

var attacking: bool = false;

enum state {
	SEECK,
	ATTACK,
	RETURN,
	REST
}

var current_state = state.SEECK;

var speed = 5.0

onready var agent : NavigationAgent = $agent

func _ready():
	if player:
		agent.set_target_location(player.transform.origin)

func _physics_process(delta):
	if is_instance_valid(player):
		match current_state:
			state.SEECK:
				var next = agent.get_next_location();
				var velocity = (next - transform.origin).normalized() * speed * delta;

				agent.set_velocity(velocity);
			state.ATTACK:
				collide_with_other_enemies(false);
				move_and_attack();
			state.RETURN:
				collide_with_other_enemies(false);
				move_and_attack();
				if global_transform.origin.distance_to(attack_target) < 0.2:
					collide_with_other_enemies(true);
					current_state = state.REST;
					attack_target = player.global_transform.origin;
					attack_timer.start();

func collide_with_other_enemies(should_collide):
		set_collision_mask_bit(2, should_collide);

func move_and_attack():
	var attack_vector: Vector3 = attack_target - global_transform.origin;
	move_and_slide(attack_vector * speed * attack_speed_multiplier);
	if attack_vector.length() < 1.5:
		if current_state == state.ATTACK:
			if player:
				var player_stats : Stats = player.get_node("Stats");
				player_stats.take_hit(1);
			current_state = state.RETURN;
			attack_target = return_target;


func _on_agent_velocity_computed(safe_velocity):
	if current_state == state.SEECK:
		move_and_collide(safe_velocity);


func _on_PathUpdateTimer_timeout():
	if is_instance_valid(player):
		agent.set_target_location(player.transform.origin)


func _on_Stats_you_died_signal():
	queue_free()


func _on_AttaqueRange_body_entered(body):
	if body == player:
		return_target = global_transform.origin;
		attack_target = player.global_transform.origin;
		current_state = state.ATTACK;
		attacking = true;
		collide_with_other_enemies(false);


func _on_AttaqueRange_body_exited(body):
	if body == player:
		attacking = false;


func _on_AttackTimer_timeout():
	if attacking == true:
		current_state = state.ATTACK;
	else:
		current_state = state.SEECK;
