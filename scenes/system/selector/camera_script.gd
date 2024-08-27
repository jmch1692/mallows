extends Camera2D

@export var follow_node : Node2D

var locked : bool = true

const ZOOM_MIN : Vector2 = Vector2(0.25,0.25)
const ZOOM_MAX : Vector2 = Vector2(1.2, 1.2)
const ZOOM_SPEED : float = 0.05
const ZOOM_FACTOR : float = 0.02

var zoom_level : Vector2 = zoom

func _process(delta: float) -> void:
	if locked:
		position = follow_node.position
	else:
		position = get_global_mouse_position() # Already lerped by camera settings (Position smoothing)
	
	print(zoom)
	zoom = lerp(zoom, zoom_level, ZOOM_SPEED)
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("free_camera"):
		locked = !locked
		
	if Input.is_action_just_pressed("zoom_in") and zoom.x <= ZOOM_MAX.x:
		zoom_level += Vector2(ZOOM_FACTOR, ZOOM_FACTOR)
#
	if Input.is_action_just_pressed("zoom_out") and zoom.x >= ZOOM_MIN.x:
		zoom_level -= Vector2(ZOOM_FACTOR, ZOOM_FACTOR)
	
	
