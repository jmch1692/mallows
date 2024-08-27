extends Node

#Bouncy signals
signal fly(force: float)

# Pointer and selector signals
signal follow_player(character: Node2D)

# Haki signals
signal hacking_started()
signal hacking_ended()
signal haki_break(hold: bool)
