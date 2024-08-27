extends StateMachineState

# Called when the state machine enters this state.
func on_enter() -> void:
	pass

# Called every frame when this state is active.
func on_process(delta: float) -> void:
	pass

# Called every physics frame when this state is active.
func on_physics_process(delta: float) -> void:
	pass

# Called when there is an input event while this state is active.
func on_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("enter"):
		SignalBus.haki_break.emit(true)
	if Input.is_action_just_released("enter"):
		SignalBus.haki_break.emit(false)
		
# Called when the state machine exits this state.
func on_exit() -> void:
	pass
