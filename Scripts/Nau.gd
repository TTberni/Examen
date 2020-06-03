extends KinematicBody2D

var vida = 100

var vel_rotacio = 0
var vel_rotacio_max = 200
var vel_max = 5
var velocitat = Vector2()
var pot_disparar = true
var escena_laser = Global.escena_laser
var meteorits_morts = 0

func _physics_process(delta):
	vel_rotacio = 0
	velocitat = Vector2()
	if Input.is_action_pressed('ui_left'):
		vel_rotacio -= vel_rotacio_max
	if Input.is_action_pressed('ui_right'):
		vel_rotacio += vel_rotacio_max
	if Input.is_action_pressed("ui_up"):
		move_local_y(-vel_max)
	else:
		pass
	if pot_disparar and Input.is_action_pressed('ui_select'):
		dispara()
	global_rotation_degrees += vel_rotacio * delta
	$Centre.global_rotation_degrees = 0

func dispara():
	pot_disparar = false
	$SoLaser.pitch_scale = rand_range(0.8, 1.2)
	$SoLaser.play()
	crea_bala($Dreta.global_position)
	crea_bala($Esquerra.global_position)
	$TimerDispara.start()

func crea_bala(posicio):
	var nou_laser = escena_laser.instance()
	nou_laser.position = posicio
	nou_laser.rotation_degrees = global_rotation_degrees
	Global.Bales.add_child(nou_laser)
	
func hit(damage):
	vida -= damage
	$AnimationPlayer.play("hit")
	$Centre/TextureProgress.actualitza(vida)

func _on_TimerDispara_timeout():
	pot_disparar = true

func _on_meteorit_mort():
	meteorits_morts += 1
	Global.Marcador.actualitza(meteorits_morts)

func mor():
	pass
