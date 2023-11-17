extends Control

func _ready():
	$HBoxContainer/Buttons/Volumen.value = db_to_linear(AudioServer.get_bus_volume_db(0))

func _on_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(0, linear_to_db(value))

func _on_sensitivity_value_changed(value):
	#get_parent().jugador.change_sensitivity(value)
	pass

func _on_back_button_pressed():
	visible= false

