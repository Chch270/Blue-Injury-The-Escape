extends MarginContainer

onready var number_label = $Bars/LifeBar/Count/Background/HpValue
onready var bar = $Bars/LifeBar/TextureProgress
onready var tween = $Tween

onready var player: Node = get_node("/root/MainScene/Player");

var animated_health = 10;


func _ready():
	var player_stats : Stats = player.get_node("Stats");
	var player_max_hp = player_stats.max_hp;
	bar.max_value = player_max_hp
	animated_health = player_max_hp
	update_health(player_max_hp)


func _on_Player_health_changed(player_health):
	update_health(player_health)


func update_health(new_value):
	tween.interpolate_property(self, "animated_health", animated_health, new_value, 0.6, Tween.TRANS_LINEAR, Tween.EASE_IN)
	if not tween.is_active():
		tween.start()


func _process(delta):
	var round_value = round(animated_health)
	number_label.text = String(round_value)
	bar.value = round_value
