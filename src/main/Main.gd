extends Node2D

onready var obstacle_spawner_timer: Timer = $ObstacleSpawner
onready var instructions: Control = $Overlay/Control

var started: bool = false

const OBSTACLE: = preload("res://src/obstacle/Obstacle.tscn")

func _ready() -> void:
	Global.score = 0

func _on_Walls_body_entered(body: Node) -> void:
	if body.filename == "res://src/player/Player.tscn":
		Global.game_over()

func _on_Walls_area_entered(area: Area2D) -> void:
	print(area)

func _input(_event: InputEvent) -> void:
	if not started:
		if Input.is_action_just_pressed("jump"):
			obstacle_spawner_timer.autostart = true
			obstacle_spawner_timer.start()
			instructions.visible = false

func _on_ObstacleSpawner_timeout() -> void:
	add_child(OBSTACLE.instance())
	Global.score += 1
