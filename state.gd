class_name State
extends Node

@export
var animation_name: String
@export
var move_speed: float = 400
@export
var run_speed: float = 800

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

var parent: Player
var animations: AnimatedSprite2D

func enter() -> void:
	animations.play(animation_name)

func exit() -> void:
	print("Exiting")
	pass

func process_input(event: InputEvent) -> State:
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null
