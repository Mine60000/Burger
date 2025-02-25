extends Node2D

@export var orders: PackedScene  # Order scene to instantiate
@export var move_speed: float = 0.2  # Speed of movement

@onready var path: Path2D = $Path2D  # Reference to Path2D

func _process(delta: float) -> void:
	for path_follow in path.get_children():
		if path_follow is PathFollow2D:
			if path_follow.has_meta("stop_progress"):  # Check if stop position is set
				var stop_progress = path_follow.get_meta("stop_progress")
				if path_follow.progress_ratio > stop_progress:  # Move orders until they reach the stop point
					path_follow.progress_ratio -= move_speed * delta

func newOrder():
	var order_instance = orders.instantiate()  # Create the order
	var path_follow = PathFollow2D.new()  # Create a new PathFollow2D
	path.add_child(path_follow)  # Attach it to Path2D
	path_follow.progress_ratio = 1.0  # Start at the rightmost point
	path_follow.add_child(order_instance)  # Add the order as a child of PathFollow2D

	# Recalculate all order positions
	update_order_positions()

func removeOrder(order: PathFollow2D):
	if order:
		order.queue_free()  # Remove only this specific order
		await get_tree().process_frame  # Wait for deletion before updating positions
		update_order_positions()  # Recalculate remaining orders

func update_order_positions():
	var orders = path.get_children().filter(func(n): return n is PathFollow2D)  # Get all orders
	var order_count = orders.size()
	
	if order_count == 0:
		return  # Nothing to update

	for i in range(order_count):
		var path_follow = orders[i]
		var stop_progress = float(i) / float(order_count)  # Evenly distribute along path
		path_follow.set_meta("stop_progress", stop_progress)


func _on_button_pressed() -> void:
	newOrder()
