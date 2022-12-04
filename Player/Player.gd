extends KinematicBody

onready var gun_controller = $GunControler;
export var mouse_sensitivity = .1

func _ready():
	GlobalSettings.connect("mouse_sens_updated", self, "_on_mouse_sens_updated")

func _on_mouse_sens_updated(value):
	mouse_sensitivity = value

var speed = 7;
var hp = 100;
var hp_max = 100;
var score = 0;
var velocity = Vector3();
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity = Vector3();
	
	if Input.is_key_pressed(KEY_Q):
		velocity.x += 1;
	if Input.is_key_pressed(KEY_D):
		velocity.x -= 1;
	if Input.is_key_pressed(KEY_Z):
		velocity.z += 1;
	if Input.is_key_pressed(KEY_S):
		velocity.z -= 1;

	velocity = velocity.normalized() * speed;
	
	move_and_slide(velocity);

	if Input.is_action_pressed("left_click"):
		gun_controller.shoot();
	if Input.is_key_pressed(KEY_R):
		gun_controller.reload();


func _on_Stats_you_died_signal(give_score):
	queue_free();
