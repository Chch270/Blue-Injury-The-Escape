extends Spatial

export var speed = 70;
export var damage = 1;

const KILL_TIME = 2;
var timer = 0;

func _physics_process(delta):
	var direction = global_transform.basis.z.normalized();
	global_translate(direction * speed * delta)

	timer += delta;
	if timer >= KILL_TIME:
		queue_free();


func _on_Area_body_entered(body : Node):
	queue_free();

	if body.has_node("Stats"):
		var stat_node : Stats = body.find_node("Stats");
		stat_node.take_hit(damage);
