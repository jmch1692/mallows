extends Node

#region Luffy signals
signal wake_up()
#endregion

#region Bouncy signals
signal fly(force: float)
signal set_aim_visibility(show: bool)
#endregion

#region Pointer and selector signals
signal follow_player(character: Node2D)
#endregion

#region Haki signals
signal hacking_started()
signal hacking_ended()
signal haki_break(hold: bool)
#endregion
