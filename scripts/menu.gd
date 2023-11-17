extends Control

var jugador 

func _on_start_button_pressed():
	if !get_tree().paused:
		get_tree().change_scene_to_file("res://scenes/room.tscn")
		change_visibility()
		await get_tree().create_timer(3).timeout
		jugador = get_parent().get_parent().get_node("Player")
	else:
		change_visibility()
		get_tree().paused = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_options_button_pressed():
	$OptionMenu.visible = true

func _on_exit_button_pressed():
	get_tree().quit()

func change_visibility():
	visible = !visible
