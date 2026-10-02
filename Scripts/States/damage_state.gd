class_name DamageState extends BaseState

func enter() -> void:
	print("Entered DamageState")

func exit() -> void:
	pass

func tick() -> void:
	pass

func tick_delta(delta: float):
	knight.health -= knight.damage * delta

func branch() -> BaseState:
	if knight.knight_entered_area == true:
		return HealState.new(knight)
	return null
