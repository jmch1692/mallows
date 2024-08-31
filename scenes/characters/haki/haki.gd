extends Mallow

@export var front_wheel : RigidBody2D
@export var rear_wheel : RigidBody2D

@onready var softbody : SoftBody2D = %SoftBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.hacking_started.connect(_on_hacking_started)
	SignalBus.hacking_ended.connect(_on_hacking_ended)
	SignalBus.haki_break.connect(_on_break.bind())
	state_machine = %FiniteStateMachine
	_state = state_machine.current_state.get_node(state_machine.current_state.get_path()).name

func _on_hacking_started():
	front_wheel.freeze = true
	rear_wheel.freeze = true
	
func _on_hacking_ended():
	front_wheel.freeze = false
	rear_wheel.freeze = false
	
func _on_finite_state_machine_state_changed(new_state : StateMachineState):
	_state = new_state.get_node(new_state.get_path()).name
		
func _on_break(hold: bool) -> void:
	if hold:
		var center_body : RigidBody2D = softbody.get_center_body().rigidbody
		if !center_body.linear_velocity.is_equal_approx(Vector2.ZERO):
			center_body.apply_central_force(-center_body.linear_velocity * 100.0)
