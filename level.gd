extends Node2D

func _draw():
	draw_rect(Rect2(40.0, 0.0, 2.0, 10.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(42.0, 8.0, 4.0, 2.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(48.0, 0.0, 2.0, 10.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(50.0, 0.0, 4.0, 2.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(50.0, 4.0, 2.0, 2.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(50.0, 8.0, 4.0, 2.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(56.0, 0.0, 2.0, 10.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(58.0, 8.0, 1.0, 2.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(60.0, 0.0, 2.0, 7.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(64.0, 0.0, 2.0, 10.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(66.0, 0.0, 4.0, 2.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(66.0, 4.0, 2.0, 2.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(66.0, 8.0, 4.0, 2.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(72.0, 0.0, 2.0, 10.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(74.0, 8.0, 4.0, 2.0), Color(0.184314, 0.309804, 0.309804, 1))

	var center_6 = Vector2(59, 7)
	var radius = 2
	var angle_from_3 = 90
	var angle_to_3 = 180
	var color = Color(0.184314, 0.309804, 0.309804, 1)

	draw_circle_arc(center_6, radius, angle_from_3, angle_to_3, color)

func draw_circle_arc(center, radius, angle_from, angle_to, color):
	var nb_points = 5
	var points_arc = PackedVector2Array()

	for i in range(nb_points + 2):
		var angle_point = deg_to_rad(angle_from + i * (angle_to-angle_from) / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)

	for index_point in range(nb_points):
		draw_line(points_arc[index_point], points_arc[index_point + 1], color, 2.0)
