extends Node2D

signal purchase
signal shop_opened

var isHidden
var purchasedItem
@export var patty_price: int
@export var bun_price: int
@export var cheese_price: int
@export var lettuce_price: int
@export var onion_price: int
@export var tomato_price: int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasGroup.hide()
	isHidden = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_open_shop_button_pressed() -> void:
	if(isHidden == 1):
		shop_opened.emit()
		$CanvasGroup.show()
		isHidden = 0
		change_prices()
	else:
		$CanvasGroup.hide()
		isHidden = 1

func change_prices() -> void:
	if(isHidden == 0):
		$CanvasGroup/Patty/Patty_button.text = str(patty_price)
		$CanvasGroup/Bun/Bun_button.text = str(bun_price)
		$CanvasGroup/Cheese/Cheese_button.text = str(cheese_price)
		$CanvasGroup/Lettuce/Lettuce_button.text = str(lettuce_price)
		$CanvasGroup/Onion/Onion_button.text = str(onion_price)
		$CanvasGroup/Tomato/Tomato_button.text = str(tomato_price)
	

func _on_patty_button_pressed() -> void:
	purchasedItem = "patty"
	purchase.emit()

func _on_bun_button_pressed() -> void:
	purchasedItem = "bun"
	purchase.emit()


func _on_cheese_button_pressed() -> void:
	purchasedItem = "cheese"
	purchase.emit()

func _on_lettuce_button_pressed() -> void:
	purchasedItem = "lettuce"
	purchase.emit()


func _on_onion_button_pressed() -> void:
	purchasedItem = "onion"
	purchase.emit()


func _on_tomato_button_pressed() -> void:
	purchasedItem = "tomato"
	purchase.emit()
