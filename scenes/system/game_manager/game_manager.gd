extends Node

func _on_hazard_body_entered(body: Node2D) -> void:
	var parent_of_body = body.owner
	if parent_of_body is Mallow:
		parent_of_body.kill()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()
