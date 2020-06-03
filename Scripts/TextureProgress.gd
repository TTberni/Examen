extends TextureProgress

var vida

func _ready():
	pass

func actualitza(nova_vida):
	$Tween.interpolate_property(self, 'value', vida, nova_vida, 0.3, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	vida = nova_vida
	$Tween.start()