class_name MoveComponent
extends Node

func get_movement_direction() -> float:
	return Input.get_axis("move_left", "move_right")

func get_movement_input() -> float:
	return Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right")
	
func wants_jump() -> bool:
	return Input.is_action_just_pressed("jump")

func wants_run() -> bool:
	return Input.is_action_pressed("run")
