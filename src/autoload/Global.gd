extends Node

var score: int = 0

onready var death_sound: AudioStreamPlayer = $AudioStreamPlayer

func game_over():
	get_tree().change_scene("res://src/gameOverScreen/GameOver.tscn")
	death_sound.play(0.53)
