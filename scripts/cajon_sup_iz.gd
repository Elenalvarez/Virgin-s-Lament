extends Control

@onready var n1 = $Numeros/ColorRect1/Label1
@onready var n2 = $Numeros/ColorRect2/Label2
@onready var n3 = $Numeros/ColorRect3/Label3
@onready var n4 = $Numeros/ColorRect4/Label4

var a: int
var b: int
var c: int
var d: int

func _on_button_1_pressed():
	a= int(n1.text)
	a += 1
	if a == 10:
		a=0
	n1.text= str(a)
	solucion()

func _on_button_2_pressed():
	b= int(n2.text)
	b += 1
	if b == 10:
		b=0
	n2.text= str(b)
	solucion()


func _on_button_3_pressed():
	c= int(n3.text)
	c += 1
	if c == 10:
		c=0
	n3.text= str(c)
	solucion()


func _on_button_4_pressed():
	d= int(n4.text)
	d += 1
	if d == 10:
		d=0
	n4.text= str(d)
	solucion()

func solucion():
	if a== 1 and b== 6 and c== 2 and d== 1:
		get_parent().get_node("Pedrolo").playing = true
		get_parent().get_node("CHIMENEA CON ESCALONES").translate(Vector3(0, 0.18, 0))
		await get_tree().create_timer(0.5).timeout
		GLOBAL.cajonSupIz = true
		GLOBAL.corazon = true
		get_node(".").visible = false
		get_parent().get_node("Corazon").visible = true
		queue_free()


func _on_salir_pressed():
	await get_tree().create_timer(0.5).timeout
	get_node(".").visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
