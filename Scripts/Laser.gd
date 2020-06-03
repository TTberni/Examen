extends Area2D

export var damage = 25
export var velocitat_laser : int = 800
var velocitat = Vector2(0, -velocitat_laser)

var deteccions = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	velocitat = velocitat.rotated(deg2rad(global_rotation_degrees))
	
func _physics_process(delta):
	position += velocitat * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Laser_area_entered(area):
	if area.has_method('hit'):
		deteccions += 1
		area.hit(damage)
	mor()

func mor():
	$AudioStreamPlayer2D.pitch_scale = rand_range(0.9, 1.1)
	$AudioStreamPlayer2D.play()
	set_deferred('visible',false)

func _on_AudioStreamPlayer2D_finished():
	queue_free()
