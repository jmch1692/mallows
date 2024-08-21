extends StateMachineState

var direction_vector : Vector2 = Vector2.UP

@onready var player : Node2D = owner

# Called when the state machine enters this state.
func on_enter():
	pass

# Called every frame when this state is active.
func on_process(delta):
	pass

# Called every physics frame when this state is active.
func on_physics_process(delta):
	pass

# Called when there is an input event while this state is active.
func on_input(event: InputEvent):
	if event.is_action_pressed("enter"):
		player.jump_direction_vector = direction_vector.normalized()
		direction_vector = Vector2.UP
		state_machine.change_state("Compress")
	
	if Input.is_action_pressed("left"):
		direction_vector += Vector2(-0.2, 0)
		direction_vector.x = max(-0.9, direction_vector.x)
		
	if Input.is_action_pressed("right"):
		direction_vector += Vector2(0.2, 0)
		direction_vector.x = min(0.9, direction_vector.x)

# Called when the state machine exits this state.
func on_exit():
	pass
