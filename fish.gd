extends Node2D


# Declare member variables here. Examples:
var speed := 70
var time := 0
var startY = position.y


var myColor

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= speed * delta
	position.y += sin(time*0.06) * delta * 10
	time += 1

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
