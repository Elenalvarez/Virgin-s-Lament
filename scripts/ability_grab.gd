extends RayCast3D

@onready var prompt = $Prompt

var object_grabbed = null
var mass_limit = 50
var throw_force = 10

var can_use = true

func _ready():
	add_exception(owner)

# This entire script is dedicated to the ability_grab node and it's child node GradPosition3D. It's allows players to pick up and throw Rigid Bodies in a similar fashion to Source games.
# This section asks the raycast to check for a Rigid Body, see if it qualifies to be carried, and grab it player isn't currently carrying a Rigid Body.
func _process(delta):
	#--PUNTERO--
	prompt.text = ""
	
	if is_colliding():
		var detected = get_collider()
		
		if detected is Interactuable :
			prompt.text = detected.name
		
		#PULSAR INTERRUPTOR
		if prompt.text == "Switch" and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			cambiar_switch()
		
		#PULSAR CAJÓN SUP DCHA
		if prompt.text == "Top right drawer" and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			if !GLOBAL.cajonSupDcha:
				var cajon = get_parent().get_parent().get_parent().get_parent().get_node("CajonSupDcha")
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
				cajon.visible = true
			else:
				var periodico = get_parent().get_parent().get_parent().get_parent().get_node("Periodico")
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
				periodico.visible = true
		
		#PULSAR CAJÓN SUP IZQ
		if prompt.text == "Top left drawer" and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and !GLOBAL.cajonSupIz:
			var cajon = get_parent().get_parent().get_parent().get_parent().get_node("CajonSupIz")
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			cajon.visible = true
		
		#PULSAR CAJÓN INF IZQ
		if prompt.text == "Bottom left drawer" and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and !GLOBAL.cajonInfIz:
			var cajon = get_parent().get_parent().get_parent().get_parent().get_node("CajonInfIz")
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			cajon.visible = true
		
		#PULSAR EL PIANO
		if prompt.text == "Piano" and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			if !GLOBAL.piano:
				var piano = get_parent().get_parent().get_parent().get_parent().get_node("Piano")
				AudioServer.set_bus_volume_db(1, -8)
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
				piano.visible = true
			else:
				var nota = get_parent().get_parent().get_parent().get_parent().get_node("NotaPiano")
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
				nota.visible = true
		
		#PULSAR BASCULA
		if prompt.text == "Weighing machine" and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and !GLOBAL.bascula:
			var bascula = get_parent().get_parent().get_parent().get_parent().get_node("Bascula")
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			bascula.visible = true
		
		#PULSAR TELESCOPIO
		if prompt.text == "Telescope" and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			var telescopio = get_parent().get_parent().get_parent().get_parent().get_node("Telescope")
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			telescopio.visible = true
			
		#CHIMENEA FINAAAAL
		if prompt.text == "Fire" and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and GLOBAL.carta:
			AudioServer.set_bus_mute(1, true)
			AudioServer.set_bus_mute(3, true)
			var video= get_parent().get_parent().get_parent().get_parent().get_node("Final")
			video.visible = true
			video.play()
	
	if Input.is_key_pressed(KEY_E):
		if can_use:
			can_use = false
			if not object_grabbed:
				if get_collider() is RigidBody3D and not get_collider() is VehicleBody3D and get_collider().mass <= mass_limit:
					object_grabbed = get_collider()
			else:
				release()
	else:
		can_use = true

	# This part throws whatever Rigid Body is held when Left-Click is pressed.
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if object_grabbed:
			object_grabbed.linear_velocity = global_transform.basis.z * -throw_force
			release()

	# This stabilizes the Rigid Body when grabbed and releases if Rigid Body gets stuck on something.
	if object_grabbed:
		var vector = $GrabPosition3D.global_transform.origin - object_grabbed.global_transform.origin
		object_grabbed.linear_velocity = vector * 20
		object_grabbed.axis_lock_angular_x = true
		object_grabbed.axis_lock_angular_y = true
		object_grabbed.axis_lock_angular_z = true
		if vector.length() >= 3:
			release()

# Releases Rigid Body, disables the axis locks, and let's the script know nothing is being grabbed.
func release():
	object_grabbed.axis_lock_angular_x = false
	object_grabbed.axis_lock_angular_y = false
	object_grabbed.axis_lock_angular_z = false
	object_grabbed = null
	
# Función para cambiar la luz del baño
func cambiar_switch():
	var luz = get_parent().get_parent().get_parent().get_parent().get_node("Luces/LuzB")
	var osc1 = get_parent().get_parent().get_parent().get_parent().get_node("Luces/OSCURIDAD2")
	var osc2 = get_parent().get_parent().get_parent().get_parent().get_node("Luces/OSCURIDAD3")
	luz.visible = !luz.visible
	osc1.visible = !luz.visible
	osc2.visible = !luz.visible
