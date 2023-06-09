extends Node2D


# Declare member variables here. Examples:
export var fish_scene: PackedScene

enum colors {RED, GREEN, BLUE}

var red = load("res://art/red_fish.png")
var green = load("res://art/green_fish.png")
var blue = load("res://art/blue_fish.png")


var nextFish := "GREEN"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("new_fish"):
		nextFish = colors.keys()[randi() % colors.size()] 

	match nextFish:
		"RED":
			get_node("Next Indicator").texture = red
		"GREEN":
			get_node("Next Indicator").texture = green
		"BLUE":
			get_node("Next Indicator").texture = blue

func _on_SpawnTimer_timeout() -> void:
	var fish = fish_scene.instance()
	var fish_spawn_location = get_node("SpawnLocation")
	
	fish.position.x = fish_spawn_location.position.x 
	fish.position.y = fish_spawn_location.position.y + 50*round(rand_range(-1, 1))
	fish.myColor = colors.keys()[randi() % colors.size()] 

	match fish.myColor:
		"RED":
			fish.get_node("Sprite").texture = red
		"GREEN":
			fish.get_node("Sprite").texture = green
		"BLUE":
			fish.get_node("Sprite").texture = blue
			
	add_child(fish)
	
