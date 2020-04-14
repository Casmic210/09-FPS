extends KinematicBody

func _on_Area_body_entered(body):
	set_color_yellow()

func _on_Area_body_exited(body):
	set_color_green()

func set_color_red():
	$Body.get_surface_material(0).set_albedo(Color(1,0,0))

func set_color_yellow():
	$Body.get_surface_material(0).set_albedo(Color(1,1,0))

func set_color_green():
	$Body.get_surface_material(0).set_albedo(Color(0,1,0))

func _on_Area2_body_entered(body):
	set_color_red()

