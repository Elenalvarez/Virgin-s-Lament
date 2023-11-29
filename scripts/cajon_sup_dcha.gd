extends Control

@onready var boton1 = $B1
@onready var boton2 = $B2
@onready var boton3 = $B3
@onready var boton4 = $B4

# COLORES = [ AZUL , VERDE, AMARILLO, ROJO]
var colores = [Color(0.4, 0.54, 0.67, 1), Color(0.37, 0.57, 0.41, 1), Color(0.91, 0.74, 0.51, 1), Color(0.67, 0.21, 0.23, 1)]
var con1=0
var con2=0
var con3=0
var con4=0

func _ready():
	boton1.color = colores[con1]
	boton2.color = colores[con2]
	boton3.color = colores[con3]
	boton4.color = colores[con4]

func _on_button_1_pressed():
	con1 += 1
	if con1 == 4:
		con1=0
	boton1.color= colores[con1]
	solucion()


func _on_button_2_pressed():
	con2 += 1
	if con2 == 4:
		con2=0
	boton2.color= colores[con2]
	solucion()


func _on_button_3_pressed():
	con3 += 1
	if con3 == 4:
		con3=0
	boton3.color= colores[con3]
	solucion()


func _on_button_4_pressed():
	con4 += 1
	if con4 == 4:
		con4=0
	boton4.color= colores[con4]
	solucion()

func solucion():
	if con1== 3 and con2== 1 and con3== 2 and con4== 0:
		get_node(".").visible = false
		GLOBAL.cajonSupDcha = true
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		queue_free()


func _on_salir_pressed():
	get_node(".").visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)	
