extends Area2D

var vida = 100
var velocitat_gir = rand_range(-5, 5)
var escala = rand_range(0.3, 1.2)
var velocitat = Vector2(200, 0).rotated(rand_range(0, 2*PI))
signal meteorit_mort

func _ready():
	scale = Vector2(escala, escala)
	connect('meteorit_mort', Global.Nau, '_on_meteorit_mort')

func _process(delta):
	rotate(velocitat_gir * delta)
	position += velocitat * delta
	if global_position.distance_squared_to(Global.Nau.global_position) > pow(3000,2):
		queue_free()

func hit(damage):
	vida -= damage
	if vida <= 0:
		mor()
		
func mor():
	emit_signal('meteorit_mort')


func _on_Meteorit_body_entered(body):
	Global.Nau.hit(20 * escala)
	mor()
