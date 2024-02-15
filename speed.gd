extends Node2D

func _draw():
	draw_rect(Rect2(8.0, 0.0, 2.0, 10.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(10.0, 0.0, 1.0, 2.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(10.0, 4.0, 1.0, 2.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(16.0, 0.0, 2.0, 10.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(18.0, 0.0, 4.0, 2.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(18.0, 4.0, 2.0, 2.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(18.0, 8.0, 4.0, 2.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(24.0, 0.0, 2.0, 10.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(26.0, 0.0, 4.0, 2.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(26.0, 4.0, 2.0, 2.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(26.0, 8.0, 4.0, 2.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(32.0, 0.0, 2.0, 10.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(34.0, 0.0, 1.0, 2.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(34.0, 8.0, 1.0, 2.0), Color(0.184314, 0.309804, 0.309804, 1))
	draw_rect(Rect2(36.0, 3.0, 2.0, 4.0), Color(0.184314, 0.309804, 0.309804, 1))

	var center = Vector2(3, 3)
	var center_2 = Vector2(3, 7)
	var center_3 = Vector2(11, 3)
	var center_4 = Vector2(35, 3)
	var center_5 = Vector2(35, 7)
	var radius = 2
	var angle_from = -180
	var angle_from_2 = 0
	var angle_from_3 = 90
	var angle_to = 90
	var angle_to_2 = 270
	var angle_to_3 = 180
	var color = Color(0.184314, 0.309804, 0.309804, 1)
	draw_circle_arc(center, radius, angle_from, angle_to, color)
	draw_circle_arc(center_2, radius, angle_from_2, angle_to_2, color)
	draw_circle_arc(center_3, radius, angle_from_2, angle_to_3, color)
	draw_circle_arc(center_4, radius, angle_from_2, angle_to, color)
	draw_circle_arc(center_5, radius, angle_from_3, angle_to_3, color)

func draw_circle_arc(center, radius, angle_from, angle_to, color):
	var nb_points = 5
	var points_arc = PackedVector2Array()

	for i in range(nb_points + 2):
		var angle_point = deg_to_rad(angle_from + i * (angle_to-angle_from) / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)

	for index_point in range(nb_points):
		draw_line(points_arc[index_point], points_arc[index_point + 1], color, 2.0)
