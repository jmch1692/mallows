extends Node2D

@onready var softbody : SoftBody2D = %SoftBody2D
@onready var state_machine : FiniteStateMachine = %FiniteStateMachine

@export var movement_speed : float = 1.0

var movement_direction : Vector2 = Vector2.ZERO
var _state : String

func _ready():
	SignalBus.wake_up.connect(_on_wake_up)
	_state = state_machine.current_state.get_node(state_machine.current_state.get_path()).name

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(abs(softbody.get_center_body().rigidbody.linear_velocity.x)) <= 400:
		softbody.apply_force((movement_direction * movement_speed) / delta)

func _on_finite_state_machine_state_changed(new_state):
	_state = new_state.get_node(new_state.get_path()).name


#TODO: Do this with signals wth
func activate() -> void:
	if _state && _state == "Inactive":
		state_machine.change_state("Idle")

func deactivate() -> void:
	if _state && _state != "Inactive":
		state_machine.change_state("Inactive")
		
func _on_wake_up():
	softbody.apply_impulse(Vector2.UP * movement_speed * 20)
	
