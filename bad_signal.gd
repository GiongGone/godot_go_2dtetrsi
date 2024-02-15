extends Node

# Be careful, this is a node effectively acting as scene passthrough as callable

signal always_turf
signal signal_turf
signal negative_turf
signal positive_turf
signal negative_take
signal positive_take

func _on_screen_z_block_i():
	print("This turf!")
	always_turf.emit()
	print(always_turf.get_connections())

func _on_always_turf():
	print("This is to create!")

func _on_block_z_turf():
	print("This is medium!")
	print("Last signal of Z!")
	#Null signal_turf.emit()
	#Null print(signal_turf.get_connections())

# This is the wall on the x turf;
func _on_frec_area_entered(_area):
	negative_turf.emit()

func _on_frec_11_area_entered(_area):
	negative_turf.emit()

func _on_frec_21_area_entered(_area):
	negative_turf.emit()

func _on_frec_31_area_entered(_area):
	negative_turf.emit()

func _on_frec_41_area_entered(_area):
	negative_turf.emit()

func _on_frec_51_area_entered(_area):
	negative_turf.emit()

func _on_frec_61_area_entered(_area):
	negative_turf.emit()

func _on_frec_71_area_entered(_area):
	negative_turf.emit()

func _on_frec_81_area_entered(_area):
	negative_turf.emit()

func _on_frec_91_area_entered(_area):
	negative_turf.emit()

func _on_frec_101_area_entered(_area):
	negative_turf.emit()

func _on_frec_111_area_entered(_area):
	negative_turf.emit()

func _on_frec_121_area_entered(_area):
	negative_turf.emit()

func _on_frec_131_area_entered(_area):
	negative_turf.emit()

func _on_frec_141_area_entered(_area):
	negative_turf.emit()

func _on_frec_151_area_entered(_area):
	negative_turf.emit()

func _on_frec_161_area_entered(_area):
	negative_turf.emit()

func _on_frec_171_area_entered(_area):
	negative_turf.emit()

func _on_frec_181_area_entered(_area):
	negative_turf.emit()

func _on_frec_191_area_entered(_area):
	negative_turf.emit()

func _on_frec_area_exited(_area):
	positive_turf.emit()

func _on_frec_11_area_exited(_area):
	positive_turf.emit()

func _on_frec_21_area_exited(_area):
	positive_turf.emit()

func _on_frec_31_area_exited(_area):
	positive_turf.emit()

func _on_frec_41_area_exited(_area):
	positive_turf.emit()

func _on_frec_51_area_exited(_area):
	positive_turf.emit()

func _on_frec_61_area_exited(_area):
	positive_turf.emit()

func _on_frec_71_area_exited(_area):
	positive_turf.emit()

func _on_frec_81_area_exited(_area):
	positive_turf.emit()

func _on_frec_91_area_exited(_area):
	positive_turf.emit()

func _on_frec_101_area_exited(_area):
	positive_turf.emit()

func _on_frec_111_area_exited(_area):
	positive_turf.emit()

func _on_frec_121_area_exited(_area):
	positive_turf.emit()

func _on_frec_131_area_exited(_area):
	positive_turf.emit()

func _on_frec_141_area_exited(_area):
	positive_turf.emit()

func _on_frec_151_area_exited(_area):
	positive_turf.emit()

func _on_frec_161_area_exited(_area):
	positive_turf.emit()

func _on_frec_171_area_exited(_area):
	positive_turf.emit()

func _on_frec_181_area_exited(_area):
	positive_turf.emit()

func _on_frec_191_area_exited(_area):
	positive_turf.emit()

func _on_frec_10_area_entered(_area):
	negative_take.emit()

func _on_frec_20_area_entered(_area):
	negative_take.emit()

func _on_frec_30_area_entered(_area):
	negative_take.emit()

func _on_frec_40_area_entered(_area):
	negative_take.emit()

func _on_frec_50_area_entered(_area):
	negative_take.emit()

func _on_frec_60_area_entered(_area):
	negative_take.emit()

func _on_frec_70_area_entered(_area):
	negative_take.emit()

func _on_frec_80_area_entered(_area):
	negative_take.emit()

func _on_frec_90_area_entered(_area):
	negative_take.emit()

func _on_frec_100_area_entered(_area):
	negative_take.emit()

func _on_frec_110_area_entered(_area):
	negative_take.emit()

func _on_frec_120_area_entered(_area):
	negative_take.emit()

func _on_frec_130_area_entered(_area):
	negative_take.emit()

func _on_frec_140_area_entered(_area):
	negative_take.emit()

func _on_frec_150_area_entered(_area):
	negative_take.emit()

func _on_frec_160_area_entered(_area):
	negative_take.emit()

func _on_frec_170_area_entered(_area):
	negative_take.emit()

func _on_frec_180_area_entered(_area):
	negative_take.emit()

func _on_frec_190_area_entered(_area):
	negative_take.emit()

func _on_frec_200_area_entered(_area):
	negative_take.emit()

func _on_frec_10_area_exited(_area):
	positive_take.emit()

func _on_frec_20_area_exited(_area):
	positive_take.emit()

func _on_frec_30_area_exited(_area):
	positive_take.emit()

func _on_frec_40_area_exited(_area):
	positive_take.emit()

func _on_frec_50_area_exited(_area):
	positive_take.emit()

func _on_frec_60_area_exited(_area):
	positive_take.emit()

func _on_frec_70_area_exited(_area):
	positive_take.emit()

func _on_frec_80_area_exited(_area):
	positive_take.emit()

func _on_frec_90_area_exited(_area):
	positive_take.emit()

func _on_frec_100_area_exited(_area):
	positive_take.emit()

func _on_frec_110_area_exited(_area):
	positive_take.emit()

func _on_frec_120_area_exited(_area):
	positive_take.emit()

func _on_frec_130_area_exited(_area):
	positive_take.emit()

func _on_frec_140_area_exited(_area):
	positive_take.emit()

func _on_frec_150_area_exited(_area):
	positive_take.emit()

func _on_frec_160_area_exited(_area):
	positive_take.emit()

func _on_frec_170_area_exited(_area):
	positive_take.emit()

func _on_frec_180_area_exited(_area):
	positive_take.emit()

func _on_frec_190_area_exited(_area):
	positive_take.emit()

func _on_frec_200_area_exited(_area):
	positive_take.emit()

# This is a second pass of functions

func _on_frec_4_area_entered(_area):
	always_turf.emit()

func _on_frec_4_area_exited(_area):
	print("Furry block!")
	signal_turf.emit()
