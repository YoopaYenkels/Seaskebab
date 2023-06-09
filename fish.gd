extends Node2D


# Declare member variables here. Examples:
export var speed := 70
var time := 0
var startY = position.y

var spearable := false
var myColor
var outline_shader = preload("res://outline_shader.tres")

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

func _on_Area2D_area_entered(area: Area2D) -> void:
	if area.is_in_group("end_bubbles"):
		$Sprite.set_material(null)
		$Sprite.z_index = -1
		spearable = false
		$AnimationPlayer.play("fade_out")
		yield( get_node("AnimationPlayer"), "animation_finished" )
		queue_free()
	else:
		$Sprite.set_material(outline_shader)
		spearable = true
