extends State

@export
var fall_state: State
@export
var idle_state: State
@export
var move_state: State

@export
var jump_force: float = 400.0

func enter() -> void:
	super()
	print("jump_state entered")
	parent.velocity.y = -jump_force

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
		return move_state
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	if parent.velocity.y > 0:
		return fall_state
	
	var movement = Input.get_axis("move_left", "move_right") * move_speed
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
