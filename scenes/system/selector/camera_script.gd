extends Camera2D

@export var follow_node : Node2D

var locked : bool = true

const ZOOM_MIN : Vector2 = Vector2(0.50,0.50)
const ZOOM_MAX : Vector2 = Vector2(1.2, 1.2)
const ZOOM_SPEED : float = 0.05
const ZOOM_FACTOR : float = 0.02

var zoom_level : Vector2 = zoom

func _process(delta: float) -> void:
	if locked:
		position = lerp(position, follow_node.global_position, 0.5)
	else:
		position = get_global_mouse_position() # Already lerped by camera settings (Position smoothing)
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("free_camera"):
		locked = !locked
		
	if Input.is_action_just_pressed("zoom_in") and zoom.x <= ZOOM_MAX.x:
		zoom_level += Vector2(ZOOM_FACTOR, ZOOM_FACTOR)
		var tween = create_tween()
		tween.tween_property(self, "zoom", zoom_level, 0.1)
		
#
	if Input.is_action_just_pressed("zoom_out") and zoom.x >= ZOOM_MIN.x:
		zoom_level -= Vector2(ZOOM_FACTOR, ZOOM_FACTOR)
		var tween = create_tween()
		tween.tween_property(self, "zoom", zoom_level, 0.1)
	
	
