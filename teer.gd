extends Label

var time = 0

func _process(delta):
	time += delta
	text = str(time) # 'text' is a built-in Label property.
	visible_characters = 10
	visible_ratio = 0.4

func _ready():
	show()
	$tau.start()

func _on_tau_timeout():
	time -= 30
