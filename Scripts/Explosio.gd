extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play('explota', -1, 1.5)
	$AudioStreamPlayer2D.pitch_scale = rand_range(0.7, 1.3)
	$AudioStreamPlayer2D.play()
	rotation = rand_range(0, 360)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
