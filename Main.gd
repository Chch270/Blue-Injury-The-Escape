extends Spatial

var ray_origin = Vector3();
var ray_target = Vector3();

onready var player = $Player;
onready var player_hand = $Player/Body/Hand;

func _physics_process(delta):
	if is_instance_valid(player):
		var mouse_position = get_viewport().get_mouse_position();
		
		ray_origin = $Camera.project_ray_origin(mouse_position);
		
		ray_target = ray_origin + $Camera.project_ray_normal(mouse_position) * 2000;
		
		var space_state = get_world().direct_space_state;
		var intersection = space_state.intersect_ray(ray_origin, ray_target, [], 8);
		
		if not intersection.empty():
			var pos = intersection.position;
	#		pos.set()
			pos.y = player.translation.y;
			player.look_at(pos, Vector3.UP);
			var dist = player_hand.global_transform.origin - pos;
			if dist.length() > 3:
				player_hand.look_at(pos, Vector3.UP);
			
