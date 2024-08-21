extends Node2D

@onready var softbody : SoftBody2D = %SoftBody2D
@onready var state_machine : FiniteStateMachine = %FiniteStateMachine

@export var movement_speed : float = 1.0

var movement_direction : Vector2 = Vector2.ZERO
var _state : String

func _ready():
	_state = state_machine.current_state.get_node(state_machine.current_state.get_path()).name

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	softbody.apply_force((movement_direction * movement_speed) / delta)

func _on_finite_state_machine_state_changed(new_state):
	_state = new_state.get_node(new_state.get_path()).name

func activate() -> void:
	if _state && _state == "Inactive":
		state_machine.change_state("Idle")

func deactivate() -> void:
	if _state && _state != "Inactive":
		state_machine.change_state("Inactive")
