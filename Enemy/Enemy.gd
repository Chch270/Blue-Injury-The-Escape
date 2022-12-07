extends KinematicBody

class_name Enemy

onready var player : Node = $"../Player"

onready var animator = $"Zombie/AnimationPlayer"

onready var attack_timer = $AttackTimer;
onready var spawning_timer = $SpawningTimer;

signal enemy_died;

var attack_speed_multiplier = 2;

var attacking: bool = false;
var is_inrange: bool = false;

enum state {
	SPAWNING,
	SEECK,
	ATTACK,
	WAIT,
	REST
}

var current_state = state.SPAWNING;

var speed = 5.0

onready var agent : NavigationAgent = $agent

func _ready():
	if player:
		agent.set_target_location(player.transform.origin);

func _physics_process(delta):
	if is_instance_valid(player):
		match current_state:
			state.SPAWNING:
				animator.play("SPAWN");
				spawning_timer.start(2.87);
				current_state = state.REST;
			state.SEECK:
				look_at(player.transform.origin, Vector3.UP);
				animator.play("RUN");
				var next = agent.get_next_location();
				var velocity = (next - transform.origin).normalized() * speed;

				agent.set_velocity(velocity);
			state.ATTACK:
				animator.play("ATK");
				animator.playback_speed = 2.0;
				collide_with_other_enemies(false);
				if !attacking && is_inrange:
					attack_timer.start(0.55);
					attacking = true;
			state.WAIT:
				animator.play("IDLE");

func collide_with_other_enemies(should_collide):
	set_collision_mask_bit(2, should_collide);
	set_collision_layer_bit(2, should_collide);


func _on_agent_velocity_computed(safe_velocity):
	if current_state == state.SEECK:
		move_and_slide(safe_velocity);


func _on_PathUpdateTimer_timeout():
	if is_instance_valid(player):
		agent.set_target_location(player.transform.origin)


func _on_Stats_you_died_signal(give_score):
	queue_free()


func _on_AttaqueRange_body_entered(body):
	if body == player:
		is_inrange = true;
		if current_state != state.SPAWNING:
			current_state = state.ATTACK;
#	collide_with_other_enemies(false);


func _on_AttaqueRange_body_exited(body):
	if body == player:
		attacking = false;
		is_inrange = false;
		attack_timer.start(0.5);


func _on_AttackTimer_timeout():
	if attacking:
		attacking = false;
		var player_stats : Stats = player.get_node("Stats");
		player_stats.take_hit(1);
		current_state = state.REST;
		attack_timer.start(0.5);
	else:
		if is_inrange:
			current_state = state.ATTACK;
		else:
			current_state = state.SEECK;
			collide_with_other_enemies(true);


func _on_SpaningTimer_timeout():
	if is_inrange:
		current_state = state.ATTACK;
	else:
		current_state = state.SEECK;
		animator.playback_speed = 1.0;
