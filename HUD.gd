extends Node2D

var isHidden
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasGroup.hide()
	isHidden = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_open_shop_button_pressed() -> void:
	if(isHidden == 1):
		$CanvasGroup.show()
		isHidden = 0
	else:
		$CanvasGroup.hide()
		isHidden = 1
