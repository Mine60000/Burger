extends Node2D

@export var move_amount: float = 30.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	createNewOrder()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func createNewOrder() -> void:
	var orderList = ["Plain Hamburger", "Cheeseburger", "Everything Burger", "Lettuce Wrap", "Onion Cheeseburger"]
	var ingredients = ["buns\npatty", "buns\npatty\ncheese", "buns\npatty\ncheese\nlettuce\ntomato\nonion", "lettuce\npatty\ntomato\nonion", "buns\npatty\ncheese\nonion"]
	var rng = RandomNumberGenerator.new()	#creates a random number generator
	var orderIndex = rng.randi_range(0,4)
	$paper/OrderName.text = str(orderList[orderIndex])	#the paper part needs to be hear or else it wont work
	$paper/OrderName.show()
	$paper/ingredientsList.text = str(ingredients[orderIndex])
	$paper/ingredientsList.show()


func _on_button_2_pressed() -> void:
	var path_follow = get_parent()  # Get the PathFollow2D container (order is inside this)
	
	if path_follow and path_follow.get_parent():  # Ensure it has a parent (Path2D)
		var path = path_follow.get_parent()  # Get the Path2D that manages orders
		
		if path.has_method("removeOrder"):  # Check if the main script has removeOrder()
			path.removeOrder(path_follow)  # Pass the PathFollow2D to be removed
