extends Node2D

@export var characters : Array[Node2D]

var softbody : SoftBody2D
var character : Node2D
var pointer : int

func _ready():
	pointer = 0
	if characters.size() > 0:
		character = characters[pointer]
		softbody = character.get_node("SoftBody2D")
		
func _input(event):
	if Input.is_action_just_pressed("select"):
		if character.has_method("deactivate") && character.is_inside_tree():
			character.deactivate()
			pointer += 1
			activate_next()
			
func activate_next() -> void:
	if pointer >= characters.size():
		pointer = 0
		
	character = characters[pointer]
	if character.has_method("activate") && character.is_inside_tree():
		character.activate()
		SignalBus.follow_player.emit(character)
		softbody = character.get_node("SoftBody2D")
