class_name DataStore
extends Node

# Player related data
@export var is_walking: bool = false
@export var is_running: bool = false
@export var is_jumping: bool = false
@export var is_falling: bool = false
@export var is_idling: bool = false
@export var is_dead: bool = false
@export var is_double_jumping: bool = false
@export var max_stamina: float = 500.0
@export var current_stamina: float = 0.0
