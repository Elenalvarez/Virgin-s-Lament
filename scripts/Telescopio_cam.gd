extends TextureRect

func _on_gui_input(event):
	if event is InputEventScreenDrag:
		position += event.relative


func _on_salir_pressed():
	await get_tree().create_timer(0.5).timeout
	get_parent().get_node(".").visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)	
