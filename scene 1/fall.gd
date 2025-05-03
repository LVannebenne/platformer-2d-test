extends State

@export
var jump_state: State
@export
var idle_state: State
@export
var move_state: State

func enter() -> void:
	super()
	print("fall_state entered")
	
func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("jump"):
		return jump_state
	return null

func process_physics(delta: float) -> State:
	
	if parent.is_on_floor():
		print("That's solid enough")
		parent.velocity.y = 0
		return idle_state
	else:
		print("process fall with gravity")
		parent.velocity.y += gravity * delta

	parent.move_and_slide()
		
	return null
