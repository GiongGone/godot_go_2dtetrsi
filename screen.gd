extends Node2D

#Set as the main scene!

var pause_p = true # Pause subject created for route
var pause_t = 0 # Last warning before, "get_tree().paused = (true or false)" strictly for scene audio process
var sound_sp = true
var sound_ssp = 0
var big_i = 0

@export var z_block: PackedScene

signal pause_i
signal pause_s
signal super_sound_s
signal super_sound_m
signal sound_ss
signal sound_mm
signal tatuso_i
signal sake_i
signal rake_i
signal mane_i
signal lane_i
signal kote_i
signal kein_i
signal ram_block # To free the queue and remove block plastic, during tests
signal z_sign # Signal busy with .emit()
signal y_sign # Signal busy with .emit()
signal x_sign # Signal busy with .emit()
signal reset_block_i
signal fto_add

func _input(_event):
	if Input.is_action_just_pressed("pause"):
		pause_check()
	if Input.is_action_just_pressed("select"):
		sound_check()
	if Input.is_action_just_pressed("exes"):
		$score.play_score()
		ram_block.emit() # This is another way to free queue and move to the next block
		return "This button closed!"
		#Not needed now; z_sign.emit()
		# Not an actual function here; xyz_block.braid_x_turf()
	if Input.is_action_just_pressed("pegs"):
		print("Really!")
		break_block()
	if Input.is_action_just_pressed("pops"):
		return "Handled by block!"


func _process(_delta): # This can be performed in timer blocks, I haven't seen any performance loss doing pauses in delta
	if  pause_t < 1: # Warning, accurately removed "print("T True!")" for messages
		pause_p = true
	if not pause_t < 1: # Warning, accurately removed "print("T False!")" for messages
		pause_p = false
	if pause_p: # Warning, accurately removed "print("Do not go to Trunity!")" for messages
		$pause.hide()
		get_tree().paused = false
	if not pause_p: # Warning, accurately removed "print("P False!")" for messages
		$pause.show()
		get_tree().paused = true
	if sound_ssp < 1:
		sound_mm.emit()
		sound_sp = true
	if not sound_ssp < 1:
		sound_ss.emit()
		sound_sp = false

func _ready():
	pause_t = 0
	pause_p = true
	

func pause_check():
	if not pause_p:
		pause_s.emit()
	if pause_p:
		pause_i.emit()

func sound_check():
	if not sound_sp:
		super_sound_s.emit()
	if sound_sp:
		super_sound_m.emit()

func break_block(): # Just do this alone to summon block
	if big_i == 1:
		sake_i.emit()
	if big_i == 2:
		rake_i.emit()
	if big_i == 3:
		mane_i.emit()
	if big_i == 4:
		lane_i.emit()
	if big_i == 5:
		kote_i.emit()
	if big_i == 6:
		kein_i.emit()
	if big_i == 7:
		tatuso_i.emit()

func shake_block():
	var array: Array[int] = [1, 2, 3, 4, 5, 6, 7]
	big_i += array.pick_random()
	# Prints either of the seven numbers, random from game; print(array.pick_random())
	print("Truly!")
	print(str(big_i) + " is the game!")
	# Prints same as the array; print(array)
	if big_i == 1:
		$bad_signal/block2.show()
		$bad_signal/block3.show()
		$bad_signal/block5.show()
		$bad_signal/block7.show()
	if big_i == 2:
		$bad_signal/block2.show()
		$bad_signal/block5.show()
		$bad_signal/block7.show()
		$bad_signal/block8.show()
	if big_i == 3:
		$bad_signal/block3.show()
		$bad_signal/block5.show()
		$bad_signal/block7.show()
		$bad_signal/block6.show()
	if big_i == 4:
		$bad_signal/block3.show()
		$bad_signal/block7.show()
		$bad_signal/block8.show()
		$bad_signal/block6.show()
	if big_i == 5:
		$bad_signal/block2.show()
		$bad_signal/block5.show()
		$bad_signal/block6.show()
		$bad_signal/block8.show()
	if big_i == 6:
		$bad_signal/block.show()
		$bad_signal/block2.show()
		$bad_signal/block3.show()
		$bad_signal/block5.show()
	if big_i == 7:
		$bad_signal/block.show()
		$bad_signal/block2.show()
		$bad_signal/block3.show()
		$bad_signal/block4.show()
	# This is the bug check, to if argument; $bad_signal/block2.hide()


func reset_block(): # This is temporary for tests, zero means block reset;
	if big_i == 1:
		big_i -= 1
		#Check; print(str(big_i))
	if big_i == 2:
		big_i -= 2
		#Check; print(str(big_i))
	if big_i == 3:
		big_i -= 3
		#Check; print(str(big_i))
	if big_i == 4:
		big_i -= 4
		#Check; print(str(big_i))
	if big_i == 5:
		big_i -= 5
		#Check; print(str(big_i))
	if big_i == 6:
		big_i -= 6
		#Check; print(str(big_i))
	if big_i == 7:
		big_i -= 7
		#Check; print(str(big_i))
	

func _on_timer_timeout():
	shake_block()
	$timer.stop()
	$tempo.start()

func _on_tempo_timeout(): # This is shorter than timer, always;
	$bad_signal/block.hide()
	$bad_signal/block2.hide()
	$bad_signal/block3.hide()
	$bad_signal/block4.hide()
	$bad_signal/block5.hide()
	$bad_signal/block6.hide()
	$bad_signal/block7.hide()
	$bad_signal/block8.hide()
	reset_block()
	$timer.start()
	$tempo.stop()

func rate():
	$x_wall.start()

func sake(): # This will create a notable shape
		# Create a new instance of the block scene
	var a_block = z_block.instantiate() # Currently is on the top var as "z_block"
		# Create a location on the Vector2 scale
	var a_block_n_location = Vector2(72, -24)
		# Set the block's position to this location
	a_block.set_position(a_block_n_location)
		# Add the call for block to appear on Main scene
	get_parent().add_child(a_block)
# This is to interact with parent blocks;
	self.x_sign.connect(a_block._on_signal_work.bind())
	self.z_sign.connect(a_block._on_z_turf.bind())
	self.y_sign.connect(a_block._on_y_turf.bind())
	self.sound_mm.connect(a_block._on_sound_off.bind())
	self.sound_ss.connect(a_block._on_sound_on.bind())
	self.ram_block.connect(a_block._on_i_repair_block.bind()) # Maybe add this to children
# This is the last operation to free the queue
	#Temporary noted; self.reset_block_i.connect(a_block._on_reset_block_i.bind())

		# Create a new instance of the block scene
	var b_block = z_block.instantiate()
		# Create a location on the Vector2 scale
	var b_block_n_location = Vector2(16, 0)
		# Set the block's position to this location
	b_block.set_position(b_block_n_location)
		# Add the call for block to appear on Main scene
	a_block.add_child(b_block)
# This is the last operation to free the queue
	self.reset_block_i.connect(b_block._on_reset_block_i.bind())
	# The code stops here!!!; self._on_reset_block_i.queue_free()

		# Create a new instance of the block scene
	var c_block = z_block.instantiate()
		# Create a location on the Vector2 scale
	var c_block_n_location = Vector2(16, 16)
		# Set the block's position to this location
	c_block.set_position(c_block_n_location)
		# Add the call for block to appear on Main scene
	a_block.add_child(c_block)
# This is the last operation to free the queue
	self.reset_block_i.connect(c_block._on_reset_block_i.bind())

		# Create a new instance of the block scene
	var d_block = z_block.instantiate()
		# Create a location on the Vector2 scale
	var d_block_n_location = Vector2(0, 16)
		# Set the block's position to this location
	d_block.set_position(d_block_n_location)
		# Add the call for block to appear on Main scene
	a_block.add_child(d_block)
# This is the last operation to free the queue
	self.reset_block_i.connect(d_block._on_reset_block_i.bind())
	b_block.broken_block()
	c_block.broken_block()
	d_block.broken_block()
	b_block.stop_child_play()
	c_block.stop_child_play()
	d_block.stop_child_play()

func rake(): # This will create a notable shape
		# Create a new instance of the block scene
	var e_block = z_block.instantiate() # Currently is on the top var as "e_block"
		# Create a location on the Vector2 scale
	var e_block_n_location = Vector2(72, -8)
		# Set the block's position to this location
	e_block.set_position(e_block_n_location)
		# Add the call for block to appear on Main scene
	add_child(e_block)
# This is to interact with parent blocks;
	self.x_sign.connect(e_block._on_signal_work.bind())
	self.z_sign.connect(e_block._on_z_turf.bind())
	self.y_sign.connect(e_block._on_y_turf.bind())
	self.sound_mm.connect(e_block._on_sound_off.bind())
	self.sound_ss.connect(e_block._on_sound_on.bind())
	self.ram_block.connect(e_block._on_i_repair_block.bind()) # Maybe add this to children
# This is the last operation to free the queue
	#Temporary noted; self.reset_block_i.connect(e_block._on_reset_block_i.bind())

		# Create a new instance of the block scene
	var f_block = z_block.instantiate()
		# Create a location on the Vector2 scale
	var f_block_n_location = Vector2(0, -16)
		# Set the block's position to this location
	f_block.set_position(f_block_n_location)
		# Add the call for block to appear on Main scene, as a child
	e_block.add_child(f_block)
# This is the last operation to free the queue
	self.reset_block_i.connect(f_block._on_reset_block_i.bind())

		# Create a new instance of the block scene
	var g_block = z_block.instantiate()
		# Create a location on the Vector2 scale
	var g_block_n_location = Vector2(16, -16)
		# Set the block's position to this location
	g_block.set_position(g_block_n_location)
		# Add the call for block to appear on Main scene
	e_block.add_child(g_block)
# This is the last operation to free the queue
	self.reset_block_i.connect(g_block._on_reset_block_i.bind())

		# Create a new instance of the block scene
	var h_block = z_block.instantiate()
		# Create a location on the Vector2 scale
	var h_block_n_location = Vector2(-16, 0)
		# Set the block's position to this location
	h_block.set_position(h_block_n_location)
		# Add the call for block to appear on Main scene
	e_block.add_child(h_block)
# This is the last operation to free the queue
	self.reset_block_i.connect(h_block._on_reset_block_i.bind())
	e_block.rake_i_operate()
	f_block.broken_block()
	g_block.broken_block()
	h_block.broken_block()
	f_block.stop_child_play()
	g_block.stop_child_play()
	h_block.stop_child_play()

func mane(): # This will create a notable shape
		# Create a new instance of the block scene
	var i_block = z_block.instantiate() # Currently is on the top var as "z_block"
		# Create a location on the Vector2 scale
	var i_block_n_location = Vector2(72, -24)
		# Set the block's position to this location
	i_block.set_position(i_block_n_location)
		# Add the call for block to appear on Main scene
	add_child(i_block)
# This is to interact with parent blocks;
	self.x_sign.connect(i_block._on_signal_work.bind())
	self.z_sign.connect(i_block._on_z_turf.bind())
	self.y_sign.connect(i_block._on_y_turf.bind())
	self.sound_mm.connect(i_block._on_sound_off.bind())
	self.sound_ss.connect(i_block._on_sound_on.bind())
	self.ram_block.connect(i_block._on_i_repair_block.bind()) # Maybe add this to children
# This is the last operation to free the queue
	#Temporary noted; self.reset_block_i.connect(i_block._on_reset_block_i.bind())

		# Create a new instance of the block scene
	var j_block = z_block.instantiate()
		# Create a location on the Vector2 scale
	var j_block_n_location = Vector2(0, 16)
		# Set the block's position to this location
	j_block.set_position(j_block_n_location)
		# Add the call for block to appear on Main scene, as a child
	i_block.add_child(j_block)
# This is the last operation to free the queue
	self.reset_block_i.connect(j_block._on_reset_block_i.bind())

		# Create a new instance of the block scene
	var k_block = z_block.instantiate()
		# Create a location on the Vector2 scale
	var k_block_n_location = Vector2(16, 16)
		# Set the block's position to this location
	k_block.set_position(k_block_n_location)
		# Add the call for block to appear on Main scene
	i_block.add_child(k_block)
# This is the last operation to free the queue
	self.reset_block_i.connect(k_block._on_reset_block_i.bind())

		# Create a new instance of the block scene
	var l_block = z_block.instantiate()
		# Create a location on the Vector2 scale
	var l_block_n_location = Vector2(-16, 0)
		# Set the block's position to this location
	l_block.set_position(l_block_n_location)
		# Add the call for block to appear on Main scene
	i_block.add_child(l_block)
# This is the last operation to free the queue
	self.reset_block_i.connect(l_block._on_reset_block_i.bind())
	i_block.mane_i_operate()
	j_block.broken_block()
	k_block.broken_block()
	l_block.broken_block()
	j_block.stop_child_play()
	k_block.stop_child_play()
	l_block.stop_child_play()

func lane(): # This will create a notable shape
		# Create a new instance of the block scene
	var m_block = z_block.instantiate() # Currently is on the top var as "z_block"
		# Create a location on the Vector2 scale
	var m_block_n_location = Vector2(72, -24)
		# Set the block's position to this location
	m_block.set_position(m_block_n_location)
		# Add the call for block to appear on Main scene
	add_child(m_block)
# This is to interact with parent blocks;
	self.x_sign.connect(m_block._on_signal_work.bind())
	self.z_sign.connect(m_block._on_z_turf.bind())
	self.y_sign.connect(m_block._on_y_turf.bind())
	self.sound_mm.connect(m_block._on_sound_off.bind())
	self.sound_ss.connect(m_block._on_sound_on.bind())
	self.ram_block.connect(m_block._on_i_repair_block.bind()) # Maybe add this to children
# This is the last operation to free the queue
	#Temporary noted; self.reset_block_i.connect(m_block._on_reset_block_i.bind())

		# Create a new instance of the block scene
	var n_block = z_block.instantiate()
		# Create a location on the Vector2 scale
	var n_block_n_location = Vector2(16, 0)
		# Set the block's position to this location
	n_block.set_position(n_block_n_location)
		# Add the call for block to appear on Main scene, as a child
	m_block.add_child(n_block)
# This is the last operation to free the queue
	self.reset_block_i.connect(n_block._on_reset_block_i.bind())

		# Create a new instance of the block scene
	var o_block = z_block.instantiate()
		# Create a location on the Vector2 scale
	var o_block_n_location = Vector2(16, 16)
		# Set the block's position to this location
	o_block.set_position(o_block_n_location)
		# Add the call for block to appear on Main scene
	m_block.add_child(o_block)
# This is the last operation to free the queue
	self.reset_block_i.connect(o_block._on_reset_block_i.bind())

		# Create a new instance of the block scene
	var p_block = z_block.instantiate()
		# Create a location on the Vector2 scale
	var p_block_n_location = Vector2(-16, 0)
		# Set the block's position to this location
	p_block.set_position(p_block_n_location)
		# Add the call for block to appear on Main scene
	m_block.add_child(p_block)
# This is the last operation to free the queue
	self.reset_block_i.connect(p_block._on_reset_block_i.bind())
	m_block.lane_i_operate()
	n_block.broken_block()
	o_block.broken_block()
	p_block.broken_block()
	n_block.stop_child_play()
	o_block.stop_child_play()
	p_block.stop_child_play()

func kote(): # This will create a notable shape
		# Create a new instance of the block scene
	var q_block = z_block.instantiate() # Currently is on the top var as "z_block"
		# Create a location on the Vector2 scale
	var q_block_n_location = Vector2(72, -24)
		# Set the block's position to this location
	q_block.set_position(q_block_n_location)
		# Add the call for block to appear on Main scene
	add_child(q_block)
# This is to interact with parent blocks;
	self.x_sign.connect(q_block._on_signal_work.bind())
	self.z_sign.connect(q_block._on_z_turf.bind())
	self.y_sign.connect(q_block._on_y_turf.bind())
	self.sound_mm.connect(q_block._on_sound_off.bind())
	self.sound_ss.connect(q_block._on_sound_on.bind())
	self.ram_block.connect(q_block._on_i_repair_block.bind()) # Maybe add this to children
# This is the last operation to free the queue
	#Temporary noted; self.reset_block_i.connect(q_block._on_reset_block_i.bind())

		# Create a new instance of the block scene
	var r_block = z_block.instantiate()
		# Create a location on the Vector2 scale
	var r_block_n_location = Vector2(-16, 0)
		# Set the block's position to this location
	r_block.set_position(r_block_n_location)
		# Add the call for block to appear on Main scene, as a child
	q_block.add_child(r_block)
# This is the last operation to free the queue
	self.reset_block_i.connect(r_block._on_reset_block_i.bind())

		# Create a new instance of the block scene
	var s_block = z_block.instantiate()
		# Create a location on the Vector2 scale
	var s_block_n_location = Vector2(-16, 16)
		# Set the block's position to this location
	s_block.set_position(s_block_n_location)
		# Add the call for block to appear on Main scene
	q_block.add_child(s_block)
# This is the last operation to free the queue
	self.reset_block_i.connect(s_block._on_reset_block_i.bind())

		# Create a new instance of the block scene
	var t_block = z_block.instantiate()
		# Create a location on the Vector2 scale
	var t_block_n_location = Vector2(16, 0)
		# Set the block's position to this location
	t_block.set_position(t_block_n_location)
		# Add the call for block to appear on Main scene
	q_block.add_child(t_block)
# This is the last operation to free the queue
	self.reset_block_i.connect(t_block._on_reset_block_i.bind())
	q_block.kote_i_operate()
	r_block.broken_block()
	s_block.broken_block()
	t_block.broken_block()
	r_block.stop_child_play()
	s_block.stop_child_play()
	t_block.stop_child_play()

func kein(): # This will create a notable shape
		# Create a new instance of the block scene
	var u_block = z_block.instantiate() # Currently is on the top var as "z_block"
		# Create a location on the Vector2 scale
	var u_block_n_location = Vector2(72, -24)
		# Set the block's position to this location
	u_block.set_position(u_block_n_location)
		# Add the call for block to appear on Main scene
	add_child(u_block)
# This is to interact with parent blocks;
	self.x_sign.connect(u_block._on_signal_work.bind())
	self.z_sign.connect(u_block._on_z_turf.bind())
	self.y_sign.connect(u_block._on_y_turf.bind())
	self.sound_mm.connect(u_block._on_sound_off.bind())
	self.sound_ss.connect(u_block._on_sound_on.bind())
	self.ram_block.connect(u_block._on_i_repair_block.bind()) # Maybe add this to children
# This is the last operation to free the queue
	#Temporary noted; self.reset_block_i.connect(u_block._on_reset_block_i.bind())

		# Create a new instance of the block scene
	var v_block = z_block.instantiate()
		# Create a location on the Vector2 scale
	var v_block_n_location = Vector2(0, 16)
		# Set the block's position to this location
	v_block.set_position(v_block_n_location)
		# Add the call for block to appear on Main scene, as a child
	u_block.add_child(v_block)
# This is the last operation to free the queue
	self.reset_block_i.connect(v_block._on_reset_block_i.bind())

		# Create a new instance of the block scene
	var w_block = z_block.instantiate()
		# Create a location on the Vector2 scale
	var w_block_n_location = Vector2(16, 16)
		# Set the block's position to this location
	w_block.set_position(w_block_n_location)
		# Add the call for block to appear on Main scene
	u_block.add_child(w_block)
# This is the last operation to free the queue
	self.reset_block_i.connect(w_block._on_reset_block_i.bind())

		# Create a new instance of the block scene
	var x_block = z_block.instantiate()
		# Create a location on the Vector2 scale
	var x_block_n_location = Vector2(-16, 16)
		# Set the block's position to this location
	x_block.set_position(x_block_n_location)
		# Add the call for block to appear on Main scene
	u_block.add_child(x_block)
# This is the last operation to free the queue
	self.reset_block_i.connect(x_block._on_reset_block_i.bind())
	u_block.kein_i_operate()
	v_block.broken_block()
	w_block.broken_block()
	x_block.broken_block()
	v_block.stop_child_play()
	w_block.stop_child_play()
	x_block.stop_child_play()

func tatuso(): # This will create a notable shape
		# Create a new instance of the block scene
	var y_block = z_block.instantiate() # Currently is on the top var as "z_block"
		# Create a location on the Vector2 scale
	var y_block_n_location = Vector2(88, -24)
		# Set the block's position to this location
	y_block.set_position(y_block_n_location)
		# Add the call for block to appear on Main scene
	add_child(y_block)
# This is to interact with parent blocks;
	self.x_sign.connect(y_block._on_signal_work.bind())
	self.z_sign.connect(y_block._on_z_turf.bind())
	self.y_sign.connect(y_block._on_y_turf.bind())
	self.sound_mm.connect(y_block._on_sound_off.bind())
	self.sound_ss.connect(y_block._on_sound_on.bind())
	self.ram_block.connect(y_block._on_i_repair_block.bind()) # Maybe add this to children
# This is the last operation to free the queue
	#Temporary noted; self.reset_block_i.connect(y_block._on_reset_block_i.bind())

		# Create a new instance of the block scene
	var yj_block = z_block.instantiate()
		# Create a location on the Vector2 scale
	var yj_block_n_location = Vector2(-16, 0)
		# Set the block's position to this location
	yj_block.set_position(yj_block_n_location)
		# Add the call for block to appear on Main scene, as a child
	y_block.add_child(yj_block)
# This is the last operation to free the queue
	self.reset_block_i.connect(yj_block._on_reset_block_i.bind())

		# Create a new instance of the block scene
	var yo_block = z_block.instantiate()
		# Create a location on the Vector2 scale
	var yo_block_n_location = Vector2(-32, 0)
		# Set the block's position to this location
	yo_block.set_position(yo_block_n_location)
		# Add the call for block to appear on Main scene
	y_block.add_child(yo_block)
# This is the last operation to free the queue
	self.reset_block_i.connect(yo_block._on_reset_block_i.bind())

		# Create a new instance of the block scene
	var yt_block = z_block.instantiate()
		# Create a location on the Vector2 scale
	var yt_block_n_location = Vector2(16, 0)
		# Set the block's position to this location
	yt_block.set_position(yt_block_n_location)
		# Add the call for block to appear on Main scene
	y_block.add_child(yt_block)
# This is the last operation to free the queue
	self.reset_block_i.connect(yt_block._on_reset_block_i.bind())
	y_block.tatuso_i_operate()
	yj_block.broken_block()
	yo_block.broken_block()
	yt_block.broken_block()
	yj_block.stop_child_play()
	yo_block.stop_child_play()
	yt_block.stop_child_play()

func _on_pause_i():
	pause_t += 1

func _on_pause_s():
	pause_t -= 1

func _on_sake_i():
	await sake()
	print("Looks like..!")
	big_i -= 1
	print(str(big_i))

func _on_rake_i():
	await rake()
	print("This is a..!")
	big_i -= 2
	print(str(big_i))

func _on_mane_i():
	await mane()
	print("Very big..!")
	big_i -= 3
	print(str(big_i))

func _on_lane_i():
	await lane()
	print("Here is a..!")
	big_i -= 4
	print(str(big_i))

func _on_kote_i():
	await kote()
	print("Wow a..!")
	big_i -= 5
	print(str(big_i))

func _on_kein_i():
	await kein()
	print("Go to a..!")
	big_i -= 6
	print(str(big_i))

func _on_tatuso_i():
	await tatuso()
	print("A strong..!")
	big_i -= 7
	print(str(big_i))

# This is wall signal;
func _on_bad_signal_negative_turf():
	$z_wall.start()

func _on_bad_signal_positive_turf():
	x_sign.emit()

func _on_bad_signal_negative_take():
	$y_wall.start()

func _on_bad_signal_positive_take():
	x_sign.emit()

func _on_z_wall_timeout():
	z_sign.emit()
	$z_wall.stop()

func _on_y_wall_timeout():
	y_sign.emit()
	$y_wall.stop()

func _on_x_wall_timeout():
	reset_block_i.emit()
	$x_wall.stop()
	fto_add.emit()


func _on_super_sound_s():
	print(sound_ssp)
	sound_ssp -= 1

func _on_super_sound_m():
	print(sound_ssp)
	sound_ssp += 1



func _on_bad_signal_signal_turf():
	$x_wall.stop()

func _on_bad_signal_always_turf():
	rate()
	reset_block_i.emit()
