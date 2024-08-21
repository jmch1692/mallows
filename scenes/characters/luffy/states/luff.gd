extends StateMachineState

@onready var player : Node2D = owner

# Called when the state machine enters this state.
func on_enter():
	pass
	
# Called every frame when this state is active.
func on_process(delta):
	var movement_direction = Input.get_axis("left", "right")
	if movement_direction > 0:
		player.movement_direction = Vector2.RIGHT
	elif movement_direction < 0:
		player.movement_direction = Vector2.LEFT
	elif movement_direction == 0:
		state_machine.change_state("Idle")
