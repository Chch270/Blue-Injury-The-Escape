extends Node

signal fps_display(value)
signal bloom_toggled(value)
signal brightness_updated(value )

func toggle_fullscreen(value):
	OS.window_fullscreen = value

func toggle_vsync(value):
	OS.vsync_enabled = value

func toggle_fps_display(value):
	emit_signal("fps_displayed", value)

func set_max_fps(value):
	Engine.target_fps = value if value < 120 else 0 

func toggle_bloom(value):
	emit_signal("bloom_toggled", value)

func update_brightness(value):
	emit_signal("brightness_updated", value)
