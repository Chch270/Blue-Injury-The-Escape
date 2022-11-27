extends Popup

# Videos settings
onready var disp_btn = $SettingTab/Video/MarginContainer/VideoSettings/DispOptBtn
onready var vsync_btn = $SettingTab/Video/MarginContainer/VideoSettings/VsyncBtn
onready var fps_btn = $SettingTab/Video/MarginContainer/VideoSettings/DispFpsBtn
onready var min_fps_val = $SettingTab/Video/MarginContainer/VideoSettings/FpsContainer/MinFpsVal
onready var fps_slider = $SettingTab/Video/MarginContainer/VideoSettings/FpsContainer/MaxFpsSlider
onready var max_fps_val = $SettingTab/Video/MarginContainer/VideoSettings/FpsContainer/MaxFpsVal
onready var bloom_btn = $SettingTab/Video/MarginContainer/VideoSettings/BloomBtn
onready var min_brighness_val = $SettingTab/Video/MarginContainer/VideoSettings/BrightnessContainer/MinBrightnessVal
onready var brightness_btn = $SettingTab/Video/MarginContainer/VideoSettings/BrightnessContainer/BrightnessSlider
onready var max_brighness_val = $SettingTab/Video/MarginContainer/VideoSettings/BrightnessContainer/MaxBrightnessVal

# Audio settings
onready var min_master_vol_val = $SettingTab/Audio/MarginContainer/AudioSettings/MasterContainer/MinMasterVal
onready var master_vol_slider = $SettingTab/Audio/MarginContainer/AudioSettings/MasterContainer/MasterVolSlider
onready var max_master_vol_val = $SettingTab/Audio/MarginContainer/AudioSettings/MasterContainer/MaxMasterVal

onready var min_music_vol_val = $SettingTab/Audio/MarginContainer/AudioSettings/MusicContainer/MinMusicVal
onready var music_vol_slider = $SettingTab/Audio/MarginContainer/AudioSettings/MusicContainer/MusicVolSlider
onready var max_music_vol_val = $SettingTab/Audio/MarginContainer/AudioSettings/MusicContainer/MaxMusicVal

onready var min_sfx_vol_val = $SettingTab/Audio/MarginContainer/AudioSettings/SfxContainer/MinSfxVal
onready var sfx_vol_slider = $SettingTab/Audio/MarginContainer/AudioSettings/SfxContainer/SfxVolSlider
onready var max_sfx_vol_val = $SettingTab/Audio/MarginContainer/AudioSettings/SfxContainer/MaxSfxVal

# Gameplay settings
onready var min_mouse_sensi_val = $SettingTab/Gameplay/MarginContainer/GameplaySettings/MouseSensiContainer/MinMouseSensiVal
onready var mouse_sensi_slider = $SettingTab/Gameplay/MarginContainer/GameplaySettings/MouseSensiContainer/MouseSensiSlider
onready var max_mouse_sensi_val = $SettingTab/Gameplay/MarginContainer/GameplaySettings/MouseSensiContainer/MaxMouseSensiVal

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 


func _on_DispOptBtn_item_selected(index):
	pass # Replace with function body.


func _on_VsyncBtn_toggled(button_pressed):
	pass # Replace with function body.


func _on_DispFpsBtn_toggled(button_pressed):
	pass # Replace with function body.


func _on_MaxFpsSlider_value_changed(value):
	pass # Replace with function body.


func _on_BloomBtn_toggled(button_pressed):
	pass # Replace with function body.


func _on_BrightnessSlider_value_changed(value):
	pass # Replace with function body.


func _on_MasterVolSlider_value_changed(value):
	pass # Replace with function body.


func _on_MusicVolSlider_value_changed(value):
	pass # Replace with function body.


func _on_SfxVolSlider_value_changed(value):
	pass # Replace with function body.


func _on_MouseSensiSlider_value_changed(value):
	pass # Replace with function body.
