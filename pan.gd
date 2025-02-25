extends Area2D

signal cooked

@export var patty: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.hide()
	$AnimatedSprite2D2.hide()
	$AudioStreamPlayer2D.stop()
	$Patty_sprite.hide()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_time_to_cook_timeout() -> void:
	$AnimatedSprite2D.hide()
	$AnimatedSprite2D2.hide()
	$Patty_sprite.hide()
	$AudioStreamPlayer2D.stop()
	cooked.emit()

func _on_mouse_entered() -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	$AnimatedSprite2D.show()
	$AnimatedSprite2D2.show()
	$AnimatedSprite2D.play()
	$AnimatedSprite2D2.play()
	$AudioStreamPlayer2D.play()
	$Patty_sprite.show()
	$"Time to Cook".start()
	body.queue_free()
