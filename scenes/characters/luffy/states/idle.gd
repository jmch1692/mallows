extends StateMachineState

@onready var player : Node2D = owner

# Called when the state machine enters this state.
func on_enter():
	player.movement_direction = Vector2.ZERO

# Called every frame when this state is active.
func on_process(delta):
	pass

# Called every physics frame when this state is active.
func on_physics_process(delta):
	pass

# Called when there is an input event while this state is active.
func on_input(event: InputEvent):
	var movement = Input.get_axis("left", "right")
	if movement != 0:
		state_machine.change_state("Luff")
	
	#TODO: Only if laying down. Maybe use a raycast to know whether the mallow is down
	if event.is_action_pressed("enter"):
		SignalBus.wake_up.emit()
		await get_tree().create_timer(2).timeout

# Called when the state machine exits this state.
func on_exit():
	pass
