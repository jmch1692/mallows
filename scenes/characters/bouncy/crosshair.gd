extends Marker2D

@export var softbody : SoftBody2D

@onready var crosshair_sprite : Sprite2D = %Crosshair

var direction_vector : Vector2 = Vector2.UP
var center_body : RigidBody2D

func _ready() -> void:
	SignalBus.set_aim_visibility.connect(_on_set_aim_visibility.bind())
	center_body = softbody.get_center_body().rigidbody
	crosshair_sprite.position.y -= 200
	
func _on_set_aim_visibility(to: bool) -> void:
	#TODO: Modulate to the inverse alpha, depending on the target visibility
	crosshair_sprite.visible = to
	crosshair_sprite.modulate.a = 0
	var tween = create_tween()
	tween.tween_property(crosshair_sprite, "modulate:a", 1.0, 0.5)
	rotation = 0.0
	
func _process(delta: float) -> void:
	position = center_body.position

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("left"):
		rotation -= 0.2
		rotation = max(-0.9, rotation)
		
	if Input.is_action_pressed("right"):
		rotation += 0.2
		rotation = min(0.9, rotation)
