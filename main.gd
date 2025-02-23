extends Node2D

@export var rawpatty: PackedScene
@export var bun: PackedScene
@export var onion: PackedScene
@export var letuce: PackedScene
@export var cheese: PackedScene
@export var tomato: PackedScene
@export var cookedpatty: PackedScene
var money
var patty_price
var bun_price
var cheese_price
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	money = 30
	change_prices()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func purchase() -> void:
	if ($HUD.purchasedItem == "patty"):
		var patty = rawpatty.instantiate()
		patty.position = Vector2(randf_range(150.0, 250.0), 100.0)
		add_child(patty)
		money = money - patty_price
	if ($HUD.purchasedItem == "bun"):
		var bun = bun.instantiate()
		bun.position = Vector2(randf_range(150.0, 250.0), 100.0)
		add_child(bun)
		money = money - bun_price
	change_money()

func change_prices() -> void:
	patty_price = randi_range(1,6)
	bun_price = randi_range(1,6)

func change_money() -> void:
	pass

func _on_timer_timeout() -> void:
	change_prices()


func _on_hud_shop_opened() -> void:
	$HUD.patty_price = patty_price
	$HUD.bun_price = bun_price
