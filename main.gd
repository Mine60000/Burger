extends Node2D

@export var rawpatty: PackedScene
@export var bun: PackedScene
@export var onion: PackedScene
@export var lettuce: PackedScene
@export var cheese: PackedScene
@export var tomato: PackedScene
@export var cookedpatty: PackedScene
var money
var patty_price
var bun_price
var cheese_price
var lettuce_price
var onion_price
var tomato_price
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	money = 30
	change_money()
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
	if ($HUD.purchasedItem == "cheese"):
		var cheese = cheese.instantiate()
		cheese.position = Vector2(randf_range(150.0, 250.0), 100.0)
		add_child(cheese)
		money = money - cheese_price
	if ($HUD.purchasedItem == "lettuce"):
		var lettuce = lettuce.instantiate()
		lettuce.position = Vector2(randf_range(150.0, 250.0), 100.0)
		add_child(lettuce)
		money = money - lettuce_price
	if ($HUD.purchasedItem == "tomato"):
		var tomato = tomato.instantiate()
		tomato.position = Vector2(randf_range(150.0, 250.0), 100.0)
		add_child(tomato)
		money = money - tomato_price
	if ($HUD.purchasedItem == "onion"):
		var onion = onion.instantiate()
		onion.position = Vector2(randf_range(150.0, 250.0), 100.0)
		add_child(onion)
		money = money - onion_price
	change_money()

func change_prices() -> void:
	patty_price = randi_range(1,6)
	bun_price = randi_range(1,6)
	cheese_price = randi_range(1,6)
	lettuce_price = randi_range(1,6)
	onion_price = randi_range(1,6)
	tomato_price = randi_range(1,6)
	_on_hud_shop_opened()
	$HUD.change_prices()

func change_money() -> void:
	$Label/value.text = str(money)

func _on_timer_timeout() -> void:
	change_prices()


func _on_hud_shop_opened() -> void:
	$HUD.patty_price = patty_price
	$HUD.bun_price = bun_price
	$HUD.cheese_price = cheese_price
	$HUD.lettuce_price = lettuce_price
	$HUD.onion_price = onion_price
	$HUD.tomato_price = tomato_price
