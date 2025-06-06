extends Node

@export
var starting_state: State

var current_state: State

func init(parent: Player, animations: AnimatedSprite2D, move_component: MoveComponent, data_store: DataStore) -> void:
	for child in get_children():
		child.parent = parent
		child.animations = animations
		child.move_component = move_component
		child.data_store = data_store
		
	change_state(starting_state)
	
func change_state(new_state: State) -> void:
	if current_state:
		current_state.exit()
		
	current_state = new_state
	current_state.enter()
	
func process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)
		
func process_input(event: InputEvent) -> void:
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)
		
func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)
