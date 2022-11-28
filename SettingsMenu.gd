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
onready var min_mouse_sens_val = $SettingTab/Gameplay/MarginContainer/GameplaySettings/MouseSensiContainer/MinMouseSensiVal
onready var mouse_sens_slider = $SettingTab/Gameplay/MarginContainer/GameplaySettings/MouseSensiContainer/MouseSensiSlider
onready var max_mouse_sens_val = $SettingTab/Gameplay/MarginContainer/GameplaySettings/MouseSensiContainer/MaxMouseSensiVal

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 


func _on_DispOptBtn_item_selected(index):
	GlobalSettings.toggle_fullscreen(true if index == 1 else false)


func _on_VsyncBtn_toggled(button_pressed):
	GlobalSettings.toggle_vsync(button_pressed)


func _on_DispFpsBtn_toggled(button_pressed):
	GlobalSettings.toggle_fps_display(button_pressed)


func _on_MaxFpsSlider_value_changed(value):
	GlobalSettings.set_max_fps(value)
	max_fps_val.text = str(value) if value < fps_slider.max_value else "max"


func _on_BloomBtn_toggled(button_pressed):
	GlobalSettings.toggle_bloom(button_pressed)


func _on_BrightnessSlider_value_changed(value):
	GlobalSettings.update_brightness(value)
	max_brighness_val.text = str(value)


func _on_MasterVolSlider_value_changed(value):
	GlobalSettings.update_vol(0, value)
	max_master_vol_val.text = str(value)


func _on_MusicVolSlider_value_changed(value):
	GlobalSettings.update_vol(1, value)
	max_music_vol_val.text = str(value)


func _on_SfxVolSlider_value_changed(value):
	GlobalSettings.update_vol(3, value)
	max_sfx_vol_val.text = str(value)


func _on_MouseSensiSlider_value_changed(value):
	GlobalSettings.update_mouse_sens(value)
	max_mouse_sens_val.text = str(value)
