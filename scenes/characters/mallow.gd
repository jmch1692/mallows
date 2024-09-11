extends Node2D
class_name Mallow

var _state : String
var state_machine : FiniteStateMachine

func activate() -> void:
	if _state && _state == "Inactive":
		state_machine.change_state("Idle")

func deactivate() -> void:
	if _state && _state != "Inactive":
		state_machine.change_state("Inactive")
		
func kill() -> void:
	#TODO: Find the closest and active spawn point, and respawn there
	print("I'm dead")
