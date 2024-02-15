extends Node2D

func _draw():
	draw_rect(Rect2(0.0, 6.0, 4.0, 14.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(8.0, 6.0, 4.0, 8.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(16.0, 0.0, 4.0, 14.0), Color(0.184314, 0.309804, 0.309804, 1))
	var center = Vector2(6, 6)
	var center_2 = Vector2(14, 14)
	var radius = 4
	var angle_from = -90
	var angle_from_2 = 270
	var angle_to = 90
	var color = Color(0.184314, 0.309804, 0.309804, 1)
	draw_circle_arc(center, radius, angle_from, angle_to, color)
	draw_circle_arc(center_2, radius, angle_from_2, angle_to, color)

func draw_circle_arc(center, radius, angle_from, angle_to, color):
	var nb_points = 5
	var points_arc = PackedVector2Array()

	for i in range(nb_points + 2):
		var angle_point = deg_to_rad(angle_from + i * (angle_to-angle_from) / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)

	for index_point in range(nb_points):
		draw_line(points_arc[index_point], points_arc[index_point + 1], color, 4.0)
