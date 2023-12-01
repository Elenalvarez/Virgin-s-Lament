extends Control

var texto="05,74"
# Called when the node enters the scene tree for the first time.


func _ready():
	if GLOBAL.corazon:
		get_node("10x10CmCorazonDeLaVirgen").visible=true
		get_node("Peso").visible=true
		get_node("Peso").text=str(texto)


func _on_salida_pressed():
	await get_tree().create_timer(0.5).timeout
	get_node(".").visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)	

