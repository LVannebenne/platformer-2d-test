extends State

@export
var idle_state: State
@export
var jump_state: State
@export
var fall_state: State
@export
var run_state: State

func enter() -> void:
	super()
	print("move_state entered")
	parent.velocity.x = move_speed
	
func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("jump") and parent.is_on_floor():
		return jump_state
	if Input.is_action_pressed("run"):
		return run_state
	return null

func process_physics(delta: float) -> State:
	var movement = Input.get_axis("move_left", "move_right") * move_speed
	if movement < 0:
		parent.animations.play("unarmed_walk_right")
	elif movement > 0:
		parent.animations.play("unarmed_walk_left")
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if movement == 0:
		return idle_state
	
	if !parent.is_on_floor():
		return fall_state
	
	return null
