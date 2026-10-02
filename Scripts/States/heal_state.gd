class_name HealState extends BaseState

func enter() -> void:
	print("Entered HealState")

func exit() -> void:
	pass

func tick() -> void:
	pass
	
func tick_delta(delta: float):
	knight.health += knight.heal * delta

func branch() -> BaseState:
	if knight.knight_entered_area == false:
		return DamageState.new(knight)
	return null
