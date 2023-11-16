extends Control

func _ready():
	$HBoxContainer/Buttons/Volumen.value = db_to_linear(AudioServer.get_bus_volume_db(0))

func _on_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(0, linear_to_db(value))

func _on_sensitivity_value_changed(value):
	pass

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


