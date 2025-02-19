extends Node2D

signal purchase
signal shop_opened

var isHidden
@export var patty_price: int
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
		$CanvasGroup/Patty/Patty_button.text = str(patty_price)
	else:
		$CanvasGroup.hide()
		isHidden = 1


func _on_button_pressed() -> void:
	purchase.emit()
