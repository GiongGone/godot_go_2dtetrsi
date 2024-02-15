extends Area2D
#All of the code here is generic and will be nullified during a packed scene instance
#However, this code is more important; if the print has "checkers" turned off on print

var bad_screen = load("res://screen.tscn")

var can_mode_i = true # Defined in areas as index
var can_mode_o = true # Defined in areas as opposite
var can_mode_u = true # Defined in areas as up
var can_mode_z = true # Defined as area "x" in construction, really not supported at the moment for instanced scenes
var block_wall_add = false
var rake_blocked = false
var rake_around = true
var rake_is = 0
var mane_blocked = false
var mane_around = true
var mane_is = 0
var lane_blocked = false
var lane_around = true
var lane_vs_around = false
var lane_is = 0
var kote_blocked = false
var kote_around = true
var kote_vs_around = false
var kote_is = 0
var kein_blocked = false
var kein_around = true
var kein_vs_around = false
var kein_is = 0
var tatuso_blocked = false
var tatuso_around = true
var tatuso_is = 0
var corked = 0
var sound_turn = 10

signal z_turf
signal y_turf
signal x_turf
signal signal_work
signal sound_off
signal sound_on

func _input(event):
	if event.is_action_pressed("ui_right"):
		right()
	if event.is_action_pressed("ui_left"):
		left()
	if event.is_action_pressed("ui_down"):
		down()
	if event.is_action_pressed("ui_up"):
		up()
	if event.is_action_pressed("ui_home"):
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("pops"):
		play_rotate()
	if Input.is_action_just_pressed("exes"):
		print("This is just a button now!")

func _ready():
	# For sample testing use "return" or just "#" ahead
	return "Get ready!"
	# For sample testing in debug use; "print(z_turf.get_connections())"
	# For sample testing in debug use; print("Block around!")

func _process(_delta): # This can be performed in timer blocks, I haven't seen any performance loss doing pauses in delta
	if rake_is > 0:
		rake_around = true
		#print(rake_is)
	if rake_is > 1:
		rake_around = false
		#print(rake_is)
	#print(rake_is)
	if mane_is > 0:
		mane_around = true
	if mane_is > 1:
		mane_around = false
	if lane_is > 0:
		lane_around = true
		lane_vs_around = false
	if lane_is > 1:
		lane_vs_around = true
	if lane_is > 2:
		lane_around = false
	if lane_is > 3:
		lane_vs_around = false
	if kote_is > 0:
		kote_around = true
		kote_vs_around = false
	if kote_is > 1:
		kote_vs_around = true
	if kote_is > 2:
		kote_around = false
	if kote_is > 3:
		kote_vs_around = false
	if kein_is > 0:
		kein_around = true
		kein_vs_around = false
	if kein_is > 1:
		kein_vs_around = true
	if kein_is > 2:
		kein_around = false
	if kein_is > 3:
		kein_vs_around = false
	if tatuso_is > 0:
		tatuso_around = true
	if tatuso_is > 1:
		tatuso_around = false

func _draw():
	# Your draw commands here
	draw_rect(Rect2(-4.5, -4.5, 9.0, 9.0), Color(0.184314, 0.309804, 0.309804, 0.89), false, 5.0)

func right():
	if not can_mode_i:
		return
	can_mode_i = true
	if corked == 1:
		translate(Vector2(16, 0))
		if sound_turn > 0:
			$click.play()
		corked -= 1
		$move.start()
		print("Right!")
		#Check; print(corked)

func left():
	if not can_mode_o:
		return
	can_mode_o = true
	if corked == 1:
		translate(Vector2(-16, 0))
		if sound_turn > 0:
			$click.play()
		corked -= 1
		$move.start()
		print("Left!")
		#Check; print(corked)

func down():
	if not can_mode_u:
		return
	can_mode_u = true
	if corked == 1:
		translate(Vector2(0, 16))
		if sound_turn > 0:
			$click.play()
		corked -= 1
		$move.start()
		print("Down!")
		#Check; print(corked)

func up():
	if not can_mode_z:
		return
	if corked == 1:
		translate(Vector2(0, -16))
		if sound_turn > 0:
			$click.play()
		corked -= 1
		$move.start()
		print("Up, in construction!")
		#Check; print(corked)

func play_rotate():
	# Warning, considering instance node hierarchy rotation will be controlled obtuse angle adjunct
	if rake_blocked:
		if rake_around:
			rotation_degrees -= 90 #This is TJ, this is always true.
			rake_is += 1
		if not rake_around:
			rotation_degrees += 90
			rake_is -= 1
			if block_wall_add:
				translate(Vector2(-16, 0))
		if sound_turn > 0:
			$clarity_automatic.play()
	if mane_blocked:
		if mane_around:
			rotation_degrees += 90 #This is TJ, this is always true.
			mane_is += 1
		if not mane_around:
			rotation_degrees -= 90
			mane_is -= 1
			if block_wall_add:
				translate(Vector2(-16, 0))
		if sound_turn > 0:
			$clarity_automatic.play()
	if lane_blocked:
		if lane_around:
			rotation_degrees += 90 #This is TJ, this is always true.
			lane_is += 1
			if lane_vs_around:
				translate(Vector2(0, 16))
				if block_wall_add:
					translate(Vector2(-16, 0))
		if not lane_around:
			rotation_degrees += 90
			translate(Vector2(-16, -16))
			lane_is += 1
			if not lane_vs_around:
				translate(Vector2(32, 16))
				lane_is -= 4
				if block_wall_add:
					translate(Vector2(-16, 0))
		if sound_turn > 0:
			$clarity_automatic.play()
	if kote_blocked:
		if kote_around:
			rotation_degrees += 90 #This is TJ, this is always true.
			kote_is += 1
			if kote_vs_around:
				translate(Vector2(0, 16))
				if block_wall_add:
					translate(Vector2(-16, 0))
		if not kote_around:
			rotation_degrees += 90
			translate(Vector2(-16, -16))
			kote_is += 1
			if not kote_vs_around:
				translate(Vector2(32, 16))
				kote_is -= 4
				if block_wall_add:
					translate(Vector2(-16, 0))
		if sound_turn > 0:
			$clarity_automatic.play()
	if kein_blocked:
		if kein_around:
			rotation_degrees += 90 #This is TJ, this is always true.
			kein_is += 1
			if kein_vs_around:
				translate(Vector2(0, 16))
				if block_wall_add:
					translate(Vector2(-16, 0))
		if not kein_around:
			rotation_degrees += 90
			translate(Vector2(-16, -16))
			kein_is += 1
			if not kein_vs_around:
				translate(Vector2(32, 16))
				kein_is -= 4
				if block_wall_add:
					translate(Vector2(-16, 0))
		if sound_turn > 0:
			$clarity_automatic.play()
	if tatuso_blocked:
		if tatuso_around:
			rotation_degrees += 90 #This is TJ, this is always true.
			tatuso_is += 1
		if not tatuso_around:
			rotation_degrees -= 90
			tatuso_is -= 1
			if block_wall_add:
				translate(Vector2(-16, 0))
		if sound_turn > 0:
			$clarity_automatic.play()

func stop_child_play():
	sound_turn = 0

func _on_bad_screen():
	
	can_mode_i = false
	can_mode_o = false
	can_mode_u = false
	can_mode_z = false

func broken_block():
	can_mode_i = false
	can_mode_o = false
	can_mode_u = false
	can_mode_z = false
	#Check; print("Brake work!")


func _on_bad_signal_signal_turf():
	print("My hero!")
	print(can_mode_i)
	print(can_mode_o)
	print(can_mode_u)
	print(can_mode_z)

func _on_x_turf():
	print("Block script!")
	print(z_turf.get_connections())
	# Now omited "return"
	z_turf.emit()

func braid_x_turf():
	x_turf.emit()
	

func _on_a_block_signal_work():
	y_turf.emit()
	signal_work.emit()
	print("That is too fat!")

# This is the wall block function;
# Stage two will require a chronological wall to be timed directly before
# a timer move for block, in math it sounds like the timer is every 0.125
# versus delta and the wall is 0.1 versus delta;


func _on_signal_work():
	can_mode_o = true
	can_mode_i = true
	block_wall_add = false
	print("Signal for..!")

func _on_z_turf():
	can_mode_o = false
	print("Why do I print!")

func _on_y_turf():
	can_mode_i = false
	block_wall_add = true
	print("This one is here!")


func _on_move_timeout():
	corked += 1
	$move.stop()

func _on_sound_off():
	sound_turn = 10
	#print(sound_turn)

func _on_sound_on():
	sound_turn = 0
	#print(sound_turn)

func repair_block():
	rake_is = 0
	rake_blocked = false
	mane_is = 0
	mane_blocked = false
	lane_is = 0
	lane_blocked = false
	kote_is = 0
	kote_blocked = false
	kein_is = 0
	kein_blocked = false
	tatuso_is = 0
	tatuso_blocked = false
	queue_free()

func _on_i_repair_block():
	repair_block()

func rake_i_operate():
	rake_blocked = true
	rake_is = 1

func mane_i_operate():
	mane_blocked = true
	mane_is = 1

func lane_i_operate():
	lane_blocked = true
	lane_is = 1

func kote_i_operate():
	kote_blocked = true
	kote_is = 1

func kein_i_operate():
	kein_blocked = true
	kein_is = 1

func tatuso_i_operate():
	tatuso_blocked = true
	tatuso_is = 1

func _on_reset_block_i():
	repair_block() # This is mostly to free the queue
