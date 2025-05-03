extends State

@export var jump_state: State
@export var idle_state: State
@export var move_state: State
@export var run_state: State

func enter() -> void:
	super()
	data_store.is_falling = true
	print("fall_state entered")

func exit() ->  void:
	super()
	data_store.is_falling = false
	
func process_input(event: InputEvent) -> State:
	match move_component.get_movement_direction():
		-1.0:
			parent.animations.play("unarmed_walk_left")
		1.0:
			parent.animations.play("unarmed_walk_right")
		_:
			parent.animations.play("default_idle")

	if move_component.wants_jump() and !data_store.is_double_jumping:
		data_store.is_double_jumping = true
		return jump_state
	return null

func process_physics(delta: float) -> State:
	
	if parent.is_on_floor():
		print("That's solid enough")
		data_store.is_double_jumping = false
		parent.velocity.y = 0
		return idle_state
	else:
		print("process fall with gravity")
		parent.velocity.y += gravity * delta

	parent.move_and_slide()
		
	return null
