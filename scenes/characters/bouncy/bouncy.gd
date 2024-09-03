extends Mallow

@onready var softbody : SoftBody2D = %SoftBody2D

var jump_direction_vector : Vector2 = Vector2.UP
var softbody_center : RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.fly.connect(_on_fly.bind())
	state_machine = %FiniteStateMachine
	_state = state_machine.current_state.get_node(state_machine.current_state.get_path()).name
	softbody_center = softbody.get_center_body().rigidbody
	
func _physics_process(delta):
	if _state == "Fly":
		var softbody_center : RigidBody2D = softbody.get_center_body().rigidbody
		if abs(softbody_center.linear_velocity.y) <= 1.0:
			softbody.apply_impulse(Vector2.ZERO)
			state_machine.change_state("Idle")

func _on_fly(force : float):
	softbody.apply_impulse(jump_direction_vector * force)

func _on_finite_state_machine_state_changed(new_state : StateMachineState):
	_state = new_state.get_node(new_state.get_path()).name
