extends Area2D

var enteredObjects
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enteredObjects = []


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	enteredObjects.add(area)


func _on_area_2d_area_exited(area: Area2D) -> void:
	enteredObjects.remove(enteredObjects.find(area))

func sell() -> void:
	for i in range(len(enteredObjects)):
		enteredObjects.pop_front().queue_free()
