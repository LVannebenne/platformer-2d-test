extends State

@export var move_state: State
@export var jump_state: State
@export var fall_state: State
@export var run_state: State

func enter() -> void:
	super()
	print("idle_state entered")
	data_store.is_idling = true
	parent.velocity.x = 0

func exit() ->  void:
	super()
	data_store.is_idling = false

func process_input(event: InputEvent) -> State:
	if move_component.wants_jump() and parent.is_on_floor():
		return jump_state
	if move_component.get_movement_input():
		return move_state
	if move_component.wants_run():
		return run_state
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		print("Not solid !")
		return fall_state
	return null
