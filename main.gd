extends Spatial


var last_mouse_position = Vector2.ZERO


func _physics_process(delta):
	$Earth.rotate_y(delta * 0.02)
	
	var mouse_delta = get_viewport().get_mouse_position() - last_mouse_position
	
	if Input.is_action_pressed("rotate"):
		$CameraBase.rotation_degrees.x = clamp(
			$CameraBase.rotation_degrees.x - mouse_delta.y * 0.4,
			-90.0, 90.0
		)
		$CameraBase.rotation_degrees.y -= mouse_delta.x * 0.4
	
	last_mouse_position = get_viewport().get_mouse_position()
