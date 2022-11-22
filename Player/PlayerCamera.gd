extends Camera


onready var player_follow: Node = $"../Player";

func _process(delta):
	if is_instance_valid(player_follow):
		var camera_pos = Vector3.ZERO;
		camera_pos.x = player_follow.translation.x;
		camera_pos.z = player_follow.translation.z - 5;
		camera_pos.y = get_translation().y;
		set_translation(camera_pos);
