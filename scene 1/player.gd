class_name Player
extends CharacterBody2D

@onready
var animations = $AnimatedSprite2D
@onready
var state_machine = $state_machine

func _ready() -> void:
	state_machine.init(self, animations)
	
func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)
	
func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	
func _process(delta: float) -> void:
	state_machine.process_frame(delta)

#const SPEED = 200.0
#const RUN_SPEED = 400.0
#const MAX_STAMINA = 200.0
#const STAM_REGEN = 5.0
#const JUMP_VELOCITY = -500.0
#const SECOND_JUMP = -400.0
#
#signal update_stam
#
#@onready var anim = $AnimatedSprite2D
#@onready var current_stam = MAX_STAMINA
#@onready var is_exhausted = false
#
#func _ready() -> void:
	#print("Am Ready !")
	#anim.play("default_idle")
#
#func _process(delta: float) -> void:
	#handle_stam()
	#pass
#
#func handle_stam():
	#clampf(current_stam, 0.0, MAX_STAMINA)
	#if current_stam == null:
		#print("is null")
		#return
	#print(current_stam)
	#if is_running():
		#print("is running, no regen")
		#current_stam = drain_stamina(current_stam)
	#else:
		#current_stam = regen_endurance(current_stam)
	#emit_signal("update_stam", current_stam)
	#
#
#func is_running() -> bool:
	#if current_stam < 1.0 or is_exhausted:
		#return false
	#if Input.is_action_pressed("run"):
		#return true
	#return false
	#
#func drain_stamina(current_level, multiplier = 1):
	#if current_level <= 1.0:
		#print("already too low")
		#is_exhausted = true
		#return current_level
	#current_level -= 1 * multiplier
	#return current_level
#
#func regen_endurance(current_level, multiplier = 1):
	#if current_level >= MAX_STAMINA:
		#print("already too high")
		#return current_level
	#current_level += STAM_REGEN * multiplier
	#if is_exhausted == true and current_level >= MAX_STAMINA * 0.3:
		#is_exhausted = false
	#return current_level
#
#func anim_to_play(direction) -> String:
	#if is_running():
		#match direction:
			#-1.0:
				#return "unarmed_run_right"
			#1.0:
				#return "unarmed_run_left"
			#_:
				#return "default_idle"
	#else:
		#match direction:
			#-1.0:
				#return "unarmed_walk_right"
			#1.0:
				#return "unarmed_walk_left"
			#_:
				#return "default_idle"
#
#func _physics_process(delta: float) -> void:
	##movements
	##velocity = Vector2(0,0)
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("move_left", "move_right")
	#var current_speed = SPEED
	#
	#if is_exhausted:
		#print("Tired...")
		#current_speed = 30.0
	#elif is_running():
		#current_speed = RUN_SPEED
#
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta * 2
#
	## Handle jump.
	#if Input.is_action_just_pressed("jump") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
	#elif Input.is_action_just_pressed("jump"):
		#velocity.y = SECOND_JUMP
	#
	#anim.play(anim_to_play(direction))
	#if direction:
		#velocity.x = direction * current_speed
	#else:
		#velocity.x = move_toward(velocity.x, 0, current_speed)
	#
	#move_and_slide()
	
	# Limit position
	#var screen_size = get_viewport_rect().size
	
	#global_position = global_position.clamp(Vector2(0,0), screen_size)
