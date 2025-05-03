extends State

@export var fall_state: State
@export var idle_state: State
@export var move_state: State
@export var run_state: State

@export
var jump_force: float = 400.0

func enter() -> void:
	super()
	print("jump_state entered")
	data_store.is_jumping = true
	parent.velocity.y = -jump_force
	
func exit() ->  void:
	super()
	data_store.is_jumping = false

func process_input(event: InputEvent) -> State:
	if move_component.get_movement_input():
		return move_state
	if move_component.wants_run():
		return run_state
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	if parent.velocity.y > 0:
		return fall_state
	
	var movement = move_component.get_movement_direction() * move_speed
	if movement < 0:
		parent.animations.play("unarmed_walk_right")
	elif movement > 0:
		parent.animations.play("unarmed_walk_left")

	parent.velocity.x = movement
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if movement != 0:
			return move_state
		return idle_state
		
	return null
