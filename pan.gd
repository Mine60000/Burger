extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play()
	$AnimatedSprite2D2.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_time_to_cook_timeout() -> void:
	
	$AnimatedSprite2D.hide()
	$AnimatedSprite2D2.hide()


func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
