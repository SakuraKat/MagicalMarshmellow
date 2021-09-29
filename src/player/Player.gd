extends KinematicBody2D

onready var animation_player: AnimationPlayer = $AnimationPlayer
onready var boing: AudioStreamPlayer = $boing

var velocity: Vector2 = Vector2.ZERO
var playing: bool = false

const JUMP_SPEED: float = -15.0
const GRAVITY: float = 0.5

func _physics_process(_delta: float) -> void:
	if playing:
		velocity.y += GRAVITY
		var collision: KinematicCollision2D
		collision = move_and_collide(velocity)

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("jump"):
		if playing:
			boing.play()
			velocity.y = JUMP_SPEED
			animation_player.play()
		else: playing = true 

func _on_Area2D_body_entered(body: Node) -> void:
	Global.game_over()
