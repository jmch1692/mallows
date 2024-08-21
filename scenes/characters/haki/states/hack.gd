extends StateMachineState


# Called when the state machine enters this state.
func on_enter() -> void:
	SignalBus.hacking_started.emit()
	
func on_exit() -> void:
	SignalBus.hacking_ended.emit()
