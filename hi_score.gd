extends Node2D

var sound_p = true
var sound_t = 10
var broken_record = 0

func _on_screen_super_sound_m():
	sound_p = false # No reason, does nothing
	sound_t -= 10
	$sound.hide()

func _on_screen_super_sound_s():
	sound_p = true # No reason, does nothing
	sound_t += 10
	$sound.show()

func _on_brock_timeout():
	$hi.hide()
	$b_rock.start()
	$brock.stop()
	broken_record += 1

func _on_b_rock_timeout():
	$hi.show()
	$brock.start()
	$b_rock.stop()
	broken_record -= 1

func _on_brock_ready():
	$brock.start()
