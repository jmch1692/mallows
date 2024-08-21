extends Marker2D

@export var character : Node2D

var follow_body : RigidBody2D

func _ready() -> void:
	SignalBus.follow_player.connect(_on_new_follow_player.bind())
	follow_body = character.softbody.get_center_body().rigidbody

func _process(delta):
	position = follow_body.global_position - Vector2(0, 150)

func _on_new_follow_player(player : Node2D) -> void:
	if player.is_node_ready():
		character = player
		follow_body = character.softbody.get_center_body().rigidbody
