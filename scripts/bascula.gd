extends Node2D

var texto=42 
# Called when the node enters the scene tree for the first time.


func _ready():
	if Corazon.corazon:
		get_node("10x10CmCorazonDeLaVirgen").visible=true
		get_node("Peso").visible=true
		get_node("Peso").text=str(texto)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_salida_pressed():
	get_node(".").visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)	


func _on_menos_pressed():
	texto-=1
	get_node("Peso").text=str(texto)
	solucion()

func _on_mas_pressed():
	texto+=1
	get_node("Peso").text=str(texto)
	solucion()
func solucion():
	if texto==51:
		get_node(".").visible = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)	
