extends Node3D

@onready var weaponParts = preload("res://Utility/WeaponParts.tres")
@onready var blade_mesh = $SwordContainter/Blade/BladeSpawn/BladeMesh
@onready var hilt_mesh = $SwordContainter/Hilt/HiltSpawn/HiltMesh
@onready var handle_mesh = $SwordContainter/Handle/HandleSpawn/HandleMesh
@onready var pummel_mesh = $SwordContainter/Pummel/PummelSpawn/PummelMesh
@onready var color_pick = $ColorPick

var bladeIndex = 0
var hiltIndex = 0
var handleIndex = 0
var pummelIndex = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if bladeIndex > 2:
		bladeIndex = 0
	elif  bladeIndex < 0:
		bladeIndex = 2
		
	if hiltIndex > 2:
		hiltIndex = 0
	elif  hiltIndex < 0:
		hiltIndex = 2
		
	if handleIndex > 2:
		handleIndex = 0
	elif  handleIndex < 0:
		handleIndex = 2
		
	if pummelIndex > 2:
		pummelIndex = 0
	elif  pummelIndex < 0:
		pummelIndex = 2
		
	blade_mesh.mesh = weaponParts.bladeMeshes[bladeIndex]
	hilt_mesh.mesh = weaponParts.HiltMeshes[hiltIndex]
	handle_mesh.mesh = weaponParts.HandleMeshes[handleIndex]
	pummel_mesh.mesh = weaponParts.PummelMeshes[pummelIndex]


func _on_blade_next_button_pressed():
	bladeIndex += 1
	pass # Replace with function body.


func _on_blade_prev_button_pressed():
	bladeIndex -= 1
	pass # Replace with function body.


func _on_hilt_next_button_pressed():
	hiltIndex += 1
	pass # Replace with function body.


func _on_hilt_prev_button_pressed():
	hiltIndex -= 1
	pass # Replace with function body.


func _on_handle_next_button_pressed():
	handleIndex += 1
	pass # Replace with function body.


func _on_handle_prev_button_pressed():
	handleIndex -=1
	pass # Replace with function body.


func _on_pummel_next_button_pressed():
	pummelIndex += 1
	pass # Replace with function body.


func _on_pummel_prev_button_pressed():
	handleIndex -= 1
	pass # Replace with function body.



func _on_panel_gui_input(event):
	if event is InputEvent:
		if Input.is_action_just_pressed("Right_Click"):
			print("Hi")
			color_pick.visible = true
			color_pick.position = get_viewport().get_mouse_position()
	pass # Replace with function body.


func _on_hud_gui_input(event):
	if event is InputEvent:
		if Input.is_action_just_pressed("Left_Click") or Input.is_action_just_pressed("Right_Click"):
			color_pick.visible = false
	pass # Replace with function body.
