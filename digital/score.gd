extends Node2D

var score_str = 0 # At ready experiment the score_f is zero, so it is added to score_str
var score_f = 0
var score_e = 0
var score_d = 0
var score_c = 0
var score_b = 0
var score_a = 0

signal points_qso # This is only emited for mind animation, kind of important

func _ready():
	return "Conceded for debug"
	# Not used for debug; $sli.start()
	# Not used for debug; $slip.start()
	# Not used for debug; print(score_a)
	# Not used for debug; print(score_b)
	# Not used for debug; print(score_c)
	# Not used for debug; print(score_d)
	# Not used for debug; print(score_e)
	# Not used for debug; print(score_f)
	# Not used for debug; print(score_str)

func _process(_delta):
	if score_f > 9:
		score_f -= 10
		score_e += 1
		score_str += 1 # This is to keep up with digital number 10
	if score_e > 9:
		score_e -= 10
		score_d += 1
	if score_d > 9:
		score_d -= 10
		score_c += 1
		score_str += 100 # This is to keep up with digital number 1000, only if 100 points are used
		points_qso.emit()
	if score_c > 9:
		score_c -= 10
		score_b += 1
	if score_b > 9:
		score_b -= 10
		score_a += 1
	if score_a > 9:
		score_a -= 10
	if score_str > 999999: # This is allowed to be watched at delta
		score_str -= 1000000 # Warning make sure to remove the score effect if this is removed
	digital() # This is the only function for updating score

# Timers are for debug and bus testing, tests will compile with all tests
func _on_slip_timeout(): # Disconnected, will emit in ready
	# "This is a second!"
	# This is to separate 0 from logical numerals
	# Technologically because I don't want to do it in factorial stasis to watch fit score
	if score_f == 1:
		score_str += score_f
	if score_f == 2:
		score_str -= 1
		score_str += score_f
	if score_f == 3:
		score_str -= 2
		score_str += score_f
	if score_f == 4:
		score_str -= 3
		score_str += score_f
	if score_f == 5:
		score_str -= 4
		score_str += score_f
	if score_f == 6:
		score_str -= 5
		score_str += score_f
	if score_f == 7:
		score_str -= 6
		score_str += score_f
	if score_f == 8:
		score_str -= 7
		score_str += score_f
	if score_f == 9:
		score_str -= 8
		score_str += score_f
	if score_str < 1:
		score_str += 1 # This will obviously repair the score effect
	$slip.start()
	print(score_str)
	score_f += 1

func _on_sli_timeout(): # Disconnected, will emit in ready
	# "This is the test"
	# This is to separate 0 from logical numerals
	# Technologically because I don't want to do it in factorial stasis to watch fit score
	if score_f == 1:
		score_str += score_f
	if score_f == 2:
		score_str -= 1
		score_str += score_f
	if score_f == 3:
		score_str -= 2
		score_str += score_f
	if score_f == 4:
		score_str -= 3
		score_str += score_f
	if score_f == 5:
		score_str -= 4
		score_str += score_f
	if score_f == 6:
		score_str -= 5
		score_str += score_f
	if score_f == 7:
		score_str -= 6
		score_str += score_f
	if score_f == 8:
		score_str -= 7
		score_str += score_f
	if score_f == 9:
		score_str -= 8
		score_str += score_f
	if score_str < 1:
		score_str += 1 # This will obviously repair the score effect
	$sli.start()
	# Null for the duration of experiments; print(score_str)
	score_f += 1

func play_score():
	if score_d == 1:
		score_str += score_d * 100
	if score_d == 2:
		score_str -= 100
		score_str += score_d * 100
	if score_d == 3:
		score_str -= 200
		score_str += score_d * 100
	if score_d == 4:
		score_str -= 300
		score_str += score_d * 100
	if score_d == 5:
		score_str -= 400
		score_str += score_d * 100
	if score_d == 6:
		score_str -= 500
		score_str += score_d * 100
	if score_d == 7:
		score_str -= 600
		score_str += score_d * 100
	if score_d == 8:
		score_str -= 700
		score_str += score_d * 100
	if score_d == 9:
		score_str -= 800
		score_str += score_d * 100
	if score_str < 100:
		score_str += 100 # This will obviously repair the score effect
	score_d += 1
	print(score_str)

func digital():
	digital_a()
	digital_b()
	digital_c()
	digital_d()
	digital_e()
	digital_f()

func digital_f():
	if score_f > 0:
		di_fone()
	if score_f > 1:
		di_ftwo()
	if score_f > 2:
		di_fthree()
	if score_f > 3:
		di_ffour()
	if score_f > 4:
		di_ffive()
	if score_f > 5:
		di_fsix()
	if score_f > 6:
		di_fseven()
	if score_f > 7:
		di_feight()
	if score_f > 8:
		di_fnine()
	if score_f > 9:
		di_fzero()
	if score_f < 1:
		di_fzero()
	return "This is not logical!"
func digital_e():
	if score_e > 0:
		di_eone()
	if score_e > 1:
		di_etwo()
	if score_e > 2:
		di_ethree()
	if score_e > 3:
		di_efour()
	if score_e > 4:
		di_efive()
	if score_e > 5:
		di_esix()
	if score_e > 6:
		di_eseven()
	if score_e > 7:
		di_eeight()
	if score_e > 8:
		di_enine()
	if score_e > 9:
		di_ezero()
	if score_e < 1:
		di_ezero()
	return "This is not legal!"
func digital_d():
	if score_d > 0:
		di_done()
	if score_d > 1:
		di_dtwo()
	if score_d > 2:
		di_dthree()
	if score_d > 3:
		di_dfour()
	if score_d > 4:
		di_dfive()
	if score_d > 5:
		di_dsix()
	if score_d > 6:
		di_dseven()
	if score_d > 7:
		di_deight()
	if score_d > 8:
		di_dnine()
	if score_d > 9:
		di_dzero()
	if score_d < 1:
		di_dzero()
	return "This is not log!"
func digital_c():
	if score_c > 0:
		di_cone()
	if score_c > 1:
		di_ctwo()
	if score_c > 2:
		di_cthree()
	if score_c > 3:
		di_cfour()
	if score_c > 4:
		di_cfive()
	if score_c > 5:
		di_csix()
	if score_c > 6:
		di_cseven()
	if score_c > 7:
		di_ceight()
	if score_c > 8:
		di_cnine()
	if score_c > 9:
		di_czero()
	if score_c < 1:
		di_czero()
	return "This is not local!"
func digital_b():
	if score_b > 0:
		di_bone()
	if score_b > 1:
		di_btwo()
	if score_b > 2:
		di_bthree()
	if score_b > 3:
		di_bfour()
	if score_b > 4:
		di_bfive()
	if score_b > 5:
		di_bsix()
	if score_b > 6:
		di_bseven()
	if score_b > 7:
		di_beight()
	if score_b > 8:
		di_bnine()
	if score_b > 9:
		di_bzero()
	if score_b < 1:
		di_bzero()
	return "This is not low!"
func digital_a():
	if score_a > 0:
		di_aone()
	if score_a > 1:
		di_atwo()
	if score_a > 2:
		di_athree()
	if score_a > 3:
		di_afour()
	if score_a > 4:
		di_afive()
	if score_a > 5:
		di_asix()
	if score_a > 6:
		di_aseven()
	if score_a > 7:
		di_aeight()
	if score_a > 8:
		di_anine()
	if score_a > 9:
		di_azero()
	if score_a < 1:
		di_azero()
	return "This is not long!"

func di_azero():
	$a6/sixa.show()
	$a6/sixb.show()
	$a6/sixe.show()
	$a6/sixg.show()
	$a6/sixf.show()
	$a6/sixc.show()
	$a6/sixd.hide()

func di_aone():
	$a6/sixa.show()
	$a6/sixb.show()
	$a6/sixe.hide()
	$a6/sixg.hide()
	$a6/sixf.hide()
	$a6/sixc.hide()
	$a6/sixd.hide()

func di_atwo():
	$a6/sixa.hide()
	$a6/sixb.show()
	$a6/sixe.show()
	$a6/sixg.hide()
	$a6/sixf.show()
	$a6/sixc.show()
	$a6/sixd.show()

func di_athree():
	$a6/sixa.show()
	$a6/sixb.show()
	$a6/sixe.show()
	$a6/sixg.hide()
	$a6/sixf.hide()
	$a6/sixc.show()
	$a6/sixd.show()

func di_afour():
	$a6/sixa.show()
	$a6/sixb.show()
	$a6/sixe.hide()
	$a6/sixg.show()
	$a6/sixf.hide()
	$a6/sixc.hide()
	$a6/sixd.show()

func di_afive():
	$a6/sixa.show()
	$a6/sixb.hide()
	$a6/sixe.show()
	$a6/sixg.show()
	$a6/sixf.hide()
	$a6/sixc.show()
	$a6/sixd.show()

func di_asix():
	$a6/sixa.show()
	$a6/sixb.hide()
	$a6/sixe.show()
	$a6/sixg.show()
	$a6/sixf.show()
	$a6/sixc.show()
	$a6/sixd.show()

func di_aseven():
	$a6/sixa.show()
	$a6/sixb.show()
	$a6/sixe.show()
	$a6/sixg.hide()
	$a6/sixf.hide()
	$a6/sixc.hide()
	$a6/sixd.hide()

func di_aeight():
	$a6/sixa.show()
	$a6/sixb.show()
	$a6/sixe.show()
	$a6/sixg.show()
	$a6/sixf.show()
	$a6/sixc.show()
	$a6/sixd.show()

func di_anine():
	$a6/sixa.show()
	$a6/sixb.show()
	$a6/sixe.show()
	$a6/sixg.show()
	$a6/sixf.hide()
	$a6/sixc.hide()
	$a6/sixd.show()

func di_bzero():
	$b5/fivea.show()
	$b5/fiveb.show()
	$b5/fivee.show()
	$b5/fiveg.show()
	$b5/fivef.show()
	$b5/fivec.show()
	$b5/fived.hide()

func di_bone():
	$b5/fivea.show()
	$b5/fiveb.show()
	$b5/fivee.hide()
	$b5/fiveg.hide()
	$b5/fivef.hide()
	$b5/fivec.hide()
	$b5/fived.hide()

func di_btwo():
	$b5/fivea.hide()
	$b5/fiveb.show()
	$b5/fivee.show()
	$b5/fiveg.hide()
	$b5/fivef.show()
	$b5/fivec.show()
	$b5/fived.show()

func di_bthree():
	$b5/fivea.show()
	$b5/fiveb.show()
	$b5/fivee.show()
	$b5/fiveg.hide()
	$b5/fivef.hide()
	$b5/fivec.show()
	$b5/fived.show()

func di_bfour():
	$b5/fivea.show()
	$b5/fiveb.show()
	$b5/fivee.hide()
	$b5/fiveg.show()
	$b5/fivef.hide()
	$b5/fivec.hide()
	$b5/fived.show()

func di_bfive():
	$b5/fivea.show()
	$b5/fiveb.hide()
	$b5/fivee.show()
	$b5/fiveg.show()
	$b5/fivef.hide()
	$b5/fivec.show()
	$b5/fived.show()

func di_bsix():
	$b5/fivea.show()
	$b5/fiveb.hide()
	$b5/fivee.show()
	$b5/fiveg.show()
	$b5/fivef.show()
	$b5/fivec.show()
	$b5/fived.show()

func di_bseven():
	$b5/fivea.show()
	$b5/fiveb.show()
	$b5/fivee.show()
	$b5/fiveg.hide()
	$b5/fivef.hide()
	$b5/fivec.hide()
	$b5/fived.hide()

func di_beight():
	$b5/fivea.show()
	$b5/fiveb.show()
	$b5/fivee.show()
	$b5/fiveg.show()
	$b5/fivef.show()
	$b5/fivec.show()
	$b5/fived.show()

func di_bnine():
	$b5/fivea.show()
	$b5/fiveb.show()
	$b5/fivee.show()
	$b5/fiveg.show()
	$b5/fivef.hide()
	$b5/fivec.hide()
	$b5/fived.show()

func di_czero():
	$c4/foura.show()
	$c4/fourb.show()
	$c4/foure.show()
	$c4/fourg.show()
	$c4/fourf.show()
	$c4/fourc.show()
	$c4/fourd.hide()

func di_cone():
	$c4/foura.show()
	$c4/fourb.show()
	$c4/foure.hide()
	$c4/fourg.hide()
	$c4/fourf.hide()
	$c4/fourc.hide()
	$c4/fourd.hide()

func di_ctwo():
	$c4/foura.hide()
	$c4/fourb.show()
	$c4/foure.show()
	$c4/fourg.hide()
	$c4/fourf.show()
	$c4/fourc.show()
	$c4/fourd.show()

func di_cthree():
	$c4/foura.show()
	$c4/fourb.show()
	$c4/foure.show()
	$c4/fourg.hide()
	$c4/fourf.hide()
	$c4/fourc.show()
	$c4/fourd.show()

func di_cfour():
	$c4/foura.show()
	$c4/fourb.show()
	$c4/foure.hide()
	$c4/fourg.show()
	$c4/fourf.hide()
	$c4/fourc.hide()
	$c4/fourd.show()

func di_cfive():
	$c4/foura.show()
	$c4/fourb.hide()
	$c4/foure.show()
	$c4/fourg.show()
	$c4/fourf.hide()
	$c4/fourc.show()
	$c4/fourd.show()

func di_csix():
	$c4/foura.show()
	$c4/fourb.hide()
	$c4/foure.show()
	$c4/fourg.show()
	$c4/fourf.show()
	$c4/fourc.show()
	$c4/fourd.show()

func di_cseven():
	$c4/foura.show()
	$c4/fourb.show()
	$c4/foure.show()
	$c4/fourg.hide()
	$c4/fourf.hide()
	$c4/fourc.hide()
	$c4/fourd.hide()

func di_ceight():
	$c4/foura.show()
	$c4/fourb.show()
	$c4/foure.show()
	$c4/fourg.show()
	$c4/fourf.show()
	$c4/fourc.show()
	$c4/fourd.show()

func di_cnine():
	$c4/foura.show()
	$c4/fourb.show()
	$c4/foure.show()
	$c4/fourg.show()
	$c4/fourf.hide()
	$c4/fourc.hide()
	$c4/fourd.show()

func di_dzero():
	$d3/threea.show()
	$d3/threeb.show()
	$d3/threee.show()
	$d3/threeg.show()
	$d3/threef.show()
	$d3/threec.show()
	$d3/threed.hide()

func di_done():
	$d3/threea.show()
	$d3/threeb.show()
	$d3/threee.hide()
	$d3/threeg.hide()
	$d3/threef.hide()
	$d3/threec.hide()
	$d3/threed.hide()

func di_dtwo():
	$d3/threea.hide()
	$d3/threeb.show()
	$d3/threee.show()
	$d3/threeg.hide()
	$d3/threef.show()
	$d3/threec.show()
	$d3/threed.show()

func di_dthree():
	$d3/threea.show()
	$d3/threeb.show()
	$d3/threee.show()
	$d3/threeg.hide()
	$d3/threef.hide()
	$d3/threec.show()
	$d3/threed.show()

func di_dfour():
	$d3/threea.show()
	$d3/threeb.show()
	$d3/threee.hide()
	$d3/threeg.show()
	$d3/threef.hide()
	$d3/threec.hide()
	$d3/threed.show()

func di_dfive():
	$d3/threea.show()
	$d3/threeb.hide()
	$d3/threee.show()
	$d3/threeg.show()
	$d3/threef.hide()
	$d3/threec.show()
	$d3/threed.show()

func di_dsix():
	$d3/threea.show()
	$d3/threeb.hide()
	$d3/threee.show()
	$d3/threeg.show()
	$d3/threef.show()
	$d3/threec.show()
	$d3/threed.show()

func di_dseven():
	$d3/threea.show()
	$d3/threeb.show()
	$d3/threee.show()
	$d3/threeg.hide()
	$d3/threef.hide()
	$d3/threec.hide()
	$d3/threed.hide()

func di_deight():
	$d3/threea.show()
	$d3/threeb.show()
	$d3/threee.show()
	$d3/threeg.show()
	$d3/threef.show()
	$d3/threec.show()
	$d3/threed.show()

func di_dnine():
	$d3/threea.show()
	$d3/threeb.show()
	$d3/threee.show()
	$d3/threeg.show()
	$d3/threef.hide()
	$d3/threec.hide()
	$d3/threed.show()

func di_ezero():
	$e2/twoa.show()
	$e2/twob.show()
	$e2/twoe.show()
	$e2/twog.show()
	$e2/twof.show()
	$e2/twoc.show()
	$e2/twod.hide()

func di_eone():
	$e2/twoa.show()
	$e2/twob.show()
	$e2/twoe.hide()
	$e2/twog.hide()
	$e2/twof.hide()
	$e2/twoc.hide()
	$e2/twod.hide()

func di_etwo():
	$e2/twoa.hide()
	$e2/twob.show()
	$e2/twoe.show()
	$e2/twog.hide()
	$e2/twof.show()
	$e2/twoc.show()
	$e2/twod.show()

func di_ethree():
	$e2/twoa.show()
	$e2/twob.show()
	$e2/twoe.show()
	$e2/twog.hide()
	$e2/twof.hide()
	$e2/twoc.show()
	$e2/twod.show()

func di_efour():
	$e2/twoa.show()
	$e2/twob.show()
	$e2/twoe.hide()
	$e2/twog.show()
	$e2/twof.hide()
	$e2/twoc.hide()
	$e2/twod.show()

func di_efive():
	$e2/twoa.show()
	$e2/twob.hide()
	$e2/twoe.show()
	$e2/twog.show()
	$e2/twof.hide()
	$e2/twoc.show()
	$e2/twod.show()

func di_esix():
	$e2/twoa.show()
	$e2/twob.hide()
	$e2/twoe.show()
	$e2/twog.show()
	$e2/twof.show()
	$e2/twoc.show()
	$e2/twod.show()

func di_eseven():
	$e2/twoa.show()
	$e2/twob.show()
	$e2/twoe.show()
	$e2/twog.hide()
	$e2/twof.hide()
	$e2/twoc.hide()
	$e2/twod.hide()

func di_eeight():
	$e2/twoa.show()
	$e2/twob.show()
	$e2/twoe.show()
	$e2/twog.show()
	$e2/twof.show()
	$e2/twoc.show()
	$e2/twod.show()

func di_enine():
	$e2/twoa.show()
	$e2/twob.show()
	$e2/twoe.show()
	$e2/twog.show()
	$e2/twof.hide()
	$e2/twoc.hide()
	$e2/twod.show()

func di_fzero():
	$f1/onea.show()
	$f1/oneb.show()
	$f1/onee.show()
	$f1/oneg.show()
	$f1/onef.show()
	$f1/onec.show()
	$f1/oned.hide()

func di_fone():
	$f1/onea.show()
	$f1/oneb.show()
	$f1/onee.hide()
	$f1/oneg.hide()
	$f1/onef.hide()
	$f1/onec.hide()
	$f1/oned.hide()

func di_ftwo():
	$f1/onea.hide()
	$f1/oneb.show()
	$f1/onee.show()
	$f1/oneg.hide()
	$f1/onef.show()
	$f1/onec.show()
	$f1/oned.show()

func di_fthree():
	$f1/onea.show()
	$f1/oneb.show()
	$f1/onee.show()
	$f1/oneg.hide()
	$f1/onef.hide()
	$f1/onec.show()
	$f1/oned.show()

func di_ffour():
	$f1/onea.show()
	$f1/oneb.show()
	$f1/onee.hide()
	$f1/oneg.show()
	$f1/onef.hide()
	$f1/onec.hide()
	$f1/oned.show()

func di_ffive():
	$f1/onea.show()
	$f1/oneb.hide()
	$f1/onee.show()
	$f1/oneg.show()
	$f1/onef.hide()
	$f1/onec.show()
	$f1/oned.show()

func di_fsix():
	$f1/onea.show()
	$f1/oneb.hide()
	$f1/onee.show()
	$f1/oneg.show()
	$f1/onef.show()
	$f1/onec.show()
	$f1/oned.show()

func di_fseven():
	$f1/onea.show()
	$f1/oneb.show()
	$f1/onee.show()
	$f1/oneg.hide()
	$f1/onef.hide()
	$f1/onec.hide()
	$f1/oned.hide()

func di_feight():
	$f1/onea.show()
	$f1/oneb.show()
	$f1/onee.show()
	$f1/oneg.show()
	$f1/onef.show()
	$f1/onec.show()
	$f1/oned.show()

func di_fnine():
	$f1/onea.show()
	$f1/oneb.show()
	$f1/onee.show()
	$f1/oneg.show()
	$f1/onef.hide()
	$f1/onec.hide()
	$f1/oned.show()

