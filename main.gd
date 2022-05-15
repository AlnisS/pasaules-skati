extends Spatial


var default_env = preload("res://default_env.tres")
var camera_space_env = preload("res://camera_space_env.tres")


var last_mouse_position = Vector2.ZERO


func _physics_process(delta):
	if $VBoxContainer/SpinningGlobe/CheckButton.pressed:
		$EarthBase/Earth.rotation.y += delta * 0.1
	
	if $VBoxContainer/FullVisibility/CheckButton.pressed:
		$CameraBase/Camera.environment = default_env
	else:
		$CameraBase/Camera.environment = camera_space_env
	
	var mouse_delta = get_viewport().get_mouse_position() - last_mouse_position
	
	if Input.is_action_pressed("rotate"):
		$CameraBase.rotation_degrees.x = clamp(
			$CameraBase.rotation_degrees.x - mouse_delta.y * 0.4,
			-90.0, 90.0
		)
		$CameraBase.rotation_degrees.y -= mouse_delta.x * 0.4
	
	last_mouse_position = get_viewport().get_mouse_position()
