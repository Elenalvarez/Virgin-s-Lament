extends Node2D
var last_button= ""
var contador=0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_7_pressed():
	$Button7/AudioStreamPlayer2D.play()
	contador=0 
	last_button="B"


func _on_button_6_pressed():
	$Button6/AudioStreamPlayer2D.play()
	if last_button=="C":
		contador=contador+1 
	else:
		contador=0 
	last_button="A"

func _on_button_5_pressed():
	$Button5/AudioStreamPlayer2D.play()
	if last_button=="A":
		contador=contador+1 
	else:
		contador=0 
	last_button="G"


func _on_button_4_pressed():
	$Button4/AudioStreamPlayer2D.play()
	last_button="F"
	contador=0


func _on_button_3_pressed():
	$Button3/AudioStreamPlayer2D.play()
	if last_button=="G":
		contador=contador+1 
	else:
		contador=0 
	last_button="E"


func _on_button_2_pressed():
	$Button2/AudioStreamPlayer2D.play()
	if last_button=="E" and contador==4:
		get_node(".").visible = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	else:
		contador=0 
	last_button="D"


func _on_button_pressed():
	$Button/AudioStreamPlayer2D.play()
	last_button="C"
	contador+=1

func _on_exit_button_pressed():
	get_node(".").visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)	
