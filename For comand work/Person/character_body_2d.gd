extends CharacterBody2D

@onready var anim = $AnimatedSprite2D


var speed = 500

var click_position = Vector2()
var target_position = Vector2()
var point = 1

func _ready():
	click_position = position

func _process(_delta):
	match point:
		1:
			anim.play("idle")
		0:
			anim.play("run")


	if velocity.x > 0:
		anim.flip_h = false
	if velocity.x < 0:
		anim.flip_h = true

	if Input.is_action_just_pressed("Left_mouse"):
		click_position = get_global_mouse_position()
	if position.distance_to(click_position) > 50:
		point = 0
		target_position = (click_position - position).normalized().x
		velocity.x = target_position * speed


		move_and_slide()
