extends Mallow

@onready var softbody : SoftBody2D = %SoftBody2D

@export var movement_speed : float = 1.0

var movement_direction : Vector2 = Vector2.ZERO
var center_body : RigidBody2D
var diagonal_directions : Array[Vector2] = [
	Vector2(cos(PI/6), sin(PI/6)), # NE
	Vector2(cos(5 * PI/6), sin(5 * PI/6)) # NW
]

# I use this to mark when luffy fell down and cannot move due to it's own weight
var need_help : bool = false

func _ready():
	state_machine = %FiniteStateMachine
	SignalBus.wake_up.connect(_on_wake_up)
	_state = state_machine.current_state.get_node(state_machine.current_state.get_path()).name
	center_body = softbody.get_center_body().rigidbody

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(abs(center_body.linear_velocity.x)) <= 250:
		softbody.apply_force((movement_direction * movement_speed) / delta)
	
	# Means it's laying on the floor, without any linear velocity left
	if abs(center_body.rotation) >= 1.5 && abs(center_body.linear_velocity.x) <= 0.1:
		need_help = true
	else:
		need_help = false

func _on_finite_state_machine_state_changed(new_state):
	_state = new_state.get_node(new_state.get_path()).name

func _on_wake_up():
	softbody.apply_impulse(diagonal_directions.pick_random() * movement_speed * 50)
	
