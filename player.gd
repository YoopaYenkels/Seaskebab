extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		$AnimationPlayer.play("idle_up")
	elif Input.is_action_pressed("ui_down"):
		$AnimationPlayer.play("idle_down")
	else:
		$AnimationPlayer.play("idle_mid")

