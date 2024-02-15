extends Node2D

var quick_si = 0

func _process(_delta):
	if quick_si == 10:
		quick_si -= 10
		$a.show()
		$b.show()
		$c.show()
		$d.show()
		$q_si.stop()
	if quick_si == 9:
		$a.show()
		$b.show()
		$c.show()
		$d.hide()
	if quick_si == 8:
		$a.show()
		$b.show()
		$c.hide()
		$d.show()
	if quick_si == 7:
		$a.show()
		$b.hide()
		$c.show()
		$d.show()
	if quick_si == 6:
		$a.hide()
		$b.show()
		$c.show()
		$d.show()
	if quick_si == 5:
		$a.show()
		$b.show()
		$c.show()
		$d.show()
	if quick_si == 4:
		$a.show()
		$b.show()
		$c.show()
		$d.hide()
	if quick_si == 3:
		$a.show()
		$b.show()
		$c.hide()
		$d.show()
	if quick_si == 2:
		$a.show()
		$b.hide()
		$c.show()
		$d.show()
	if quick_si == 1:
		$a.hide()
		$b.show()
		$c.show()
		$d.show()

func quick_sso():
	$q_si.start()

func _on_q_si_timeout():
	$q_si.start()
	quick_si += 1

func _on_score_points_qso():
	quick_sso()
