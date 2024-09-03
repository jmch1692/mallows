extends Marker2D

@export var character : Node2D

@onready var pointer_sprite : Sprite2D = $Arrow
@onready var timer : Timer = $Timer

var follow_body : RigidBody2D

func _ready() -> void:
	SignalBus.follow_player.connect(_on_new_follow_player.bind())
	follow_body = character.softbody.get_center_body().rigidbody
	pointer_sprite.modulate.a = 1.0
	timer.start()

func _process(delta):
	position = follow_body.global_position - Vector2(0, 150)

func _on_new_follow_player(player : Node2D) -> void:
	if player.is_node_ready():
		pointer_sprite.modulate.a = 1.0
		character = player
		follow_body = character.softbody.get_center_body().rigidbody
		timer.start()

func _on_timer_timeout() -> void:
	var tween = create_tween()
	tween.tween_property(pointer_sprite, "modulate:a", 0.0, 2.0)
