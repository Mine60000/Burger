extends Node2D

@export var rawpatty: PackedScene
var money
var patty_price
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	money = 30


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func purchase() -> void:
	var patty = rawpatty.instantiate()
	patty.position = Vector2(randf_range(150.0, 250.0), 100.0)
	add_child(patty)

func change_prices() -> void:
	$HUD.patty_price = randi_range(1,6)
