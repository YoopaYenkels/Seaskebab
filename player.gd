extends Node2D

# Declare member variables here. Examples:
var attack_over := true 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):	
		if Input.is_action_just_pressed("spear_fish"):
			playAttackAnim("attack_up")
		elif attack_over:
			$AnimationPlayer.play("idle_up")
	elif Input.is_action_pressed("ui_down"):
		if Input.is_action_just_pressed("spear_fish"):
			playAttackAnim("attack_down")
		elif attack_over:
			$AnimationPlayer.play("idle_down")
	elif Input.is_action_just_pressed("spear_fish"):
		playAttackAnim("attack_mid")
		
	elif attack_over:
		$AnimationPlayer.play("idle_mid")
		
func playAttackAnim(_name: String) -> void:
	attack_over = false
	$AnimationPlayer.play(_name)
	yield( get_node("AnimationPlayer"), "animation_finished" )
	attack_over = true
	
	

