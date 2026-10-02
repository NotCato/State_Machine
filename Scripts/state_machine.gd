class_name StateMachine extends RefCounted

var target: Knight
var current_state: BaseState

func _init(knight: Knight, state: BaseState) -> void:
	target = knight
	change(state)

func tick(delta: float) -> void:
	current_state.tick()
	current_state.tick_delta(delta)
	check_conditions()

func check_conditions() -> void:
	var new_state: BaseState = current_state.branch()
	if new_state != null:
		change(new_state)

func change(new_state: BaseState) -> void:
	if current_state != null:
		current_state.exit()
	current_state = new_state
	current_state.enter()
