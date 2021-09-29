extends Control

onready var score: Label = $VBoxContainer/Score

func _ready() -> void:
	score.text = score.text % Global.score

func _on_PlayButton_button_up() -> void:
	get_tree().change_scene("res://src/main/Main.tscn")

func _on_QuitButton_button_up() -> void:
	get_tree().quit()
