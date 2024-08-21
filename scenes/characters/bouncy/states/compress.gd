extends StateMachineState

var jump_force : float = 0.0

const JUMP_INCREASE_FORCE : float = 1.0
const MAX_JUMP_FORCE : float = 80.0

# Called when the state machine enters this state.
func on_enter():
	pass

# Called every frame when this state is active.
func on_process(delta):
	if Input.is_action_pressed("enter"):
		if jump_force <= MAX_JUMP_FORCE:
			jump_force += JUMP_INCREASE_FORCE
	if Input.is_action_just_released("enter"):
		SignalBus.fly.emit(min(MAX_JUMP_FORCE, jump_force))
		jump_force = 0.0
		state_machine.change_state("Fly")
		
# Called every physics frame when this state is active.
func on_physics_process(delta):
	pass

# Called when there is an input event while this state is active.
func on_input(event: InputEvent):
	pass

# Called when the state machine exits this state.
func on_exit():
	pass
