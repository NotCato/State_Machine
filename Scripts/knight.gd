class_name Knight extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


@export var vision_range: float = 32.0
@export var attack_range: float = 16.0
@export var speed: float = 8.0

var damage = 10
var heal = 5
var health = 100
var knight_entered_area = false
var state_machine: StateMachine
var state_machine_2: StateMachine
var direction_to_cursor: Vector2

func _ready() -> void:
	var idle_state = IdleState.new(self)
	state_machine = StateMachine.new(self, idle_state)
	
	var healState = HealState.new(self)
	state_machine_2 = StateMachine.new(self, healState)

func _process(delta: float) -> void:
	read_cursor_position()

func _physics_process(delta: float) -> void:
	state_machine.tick(delta)
	state_machine_2.tick(delta)

func read_cursor_position() -> void:
	direction_to_cursor = get_global_mouse_position() - global_position

func cursor_within_vision_radius() -> bool:
	return direction_to_cursor.length() < vision_range

func cursor_within_attack_range() -> bool:
	return direction_to_cursor.length() < attack_range

func _draw() -> void:
	draw_arc(Vector2.ZERO, vision_range, 0, TAU, 64, Color.BLUE, 0.5)
	draw_arc(Vector2.ZERO, attack_range, 0, TAU, 64, Color.RED, 0.5)
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	print ("enter")
	knight_entered_area = true
	return

func _on_area_2d_body_exited(body: Node2D) -> void:
	print ("left")
	knight_entered_area = false
	return 
