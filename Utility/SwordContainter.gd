extends Node3D

@onready var timer = $Timer


var rotating = false
var prevMousPos
var currentMousePos
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("Left_Click"):
		rotating = true
		timer.stop()
		prevMousPos = get_viewport().get_mouse_position()
		pass
	elif Input.is_action_just_released("Left_Click"):
		rotating = false
		timer.start()
		pass
		
	if rotating:
		currentMousePos = get_viewport().get_mouse_position()
		rotate_y((currentMousePos.x - prevMousPos.x) * .1 * delta)
		#rotate_x((currentMousePos.y - prevMousPos.y) * .1 * delta)
		prevMousPos = currentMousePos


func _on_timer_timeout():
	var tween = create_tween()
	tween.tween_property(self, "rotation", Vector3.ZERO, .5)
	pass # Replace with function body.
