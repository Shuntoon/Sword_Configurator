extends Node3D

@onready var weaponParts = preload("res://Utility/WeaponParts.tres")
@onready var blade_mesh = $SwordContainter/Blade/BladeSpawn/BladeMesh
@onready var hilt_mesh = $SwordContainter/Hilt/HiltSpawn/HiltMesh
@onready var handle_mesh = $SwordContainter/Handle/HandleSpawn/HandleMesh
@onready var pummel_mesh = $SwordContainter/Pummel/PummelSpawn/PummelMesh

@onready var color_pick_blade = $ColorPickBlade
@onready var color_pick_hilt = $ColorPickHilt
@onready var color_pick_handle = $ColorPickHandle
@onready var color_pick_pummel = $ColorPickPummel


@export var transitionSpeed = .2
@export var startSize = Vector3(.1,.1,.1)
@export var colorPickPos = Vector2(200,0)

var bladeIndex = 0
var hiltIndex = 0
var handleIndex = 0
var pummelIndex = 0

var bladeColor = Color.DARK_GRAY
var hiltColor = Color.GOLD
var handleColor = Color.DARK_RED
var pummelColor = Color.GOLD

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if bladeIndex > 3:
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
	var bladeMeshMat = blade_mesh.get_active_material(0)
	bladeColor = color_pick_blade.get_node("Panel/ColorPickerButton").color
	bladeMeshMat.albedo_color = bladeColor
	
	hilt_mesh.mesh = weaponParts.HiltMeshes[hiltIndex]
	var hiltMeshMat = hilt_mesh.get_active_material(0)
	hiltColor = color_pick_hilt.get_node("Panel/ColorPickerButton").color
	hiltMeshMat.albedo_color = hiltColor
	
	handle_mesh.mesh = weaponParts.HandleMeshes[handleIndex]
	var handleMeshMat = handle_mesh.get_active_material(0)
	handleColor = color_pick_handle.get_node("Panel/ColorPickerButton").color
	handleMeshMat.albedo_color = handleColor
	
	pummel_mesh.mesh = weaponParts.PummelMeshes[pummelIndex]
	var pummelMeshMat = pummel_mesh.get_active_material(0)
	pummelColor = color_pick_pummel.get_node("Panel/ColorPickerButton").color
	pummelMeshMat.albedo_color = pummelColor


func _on_blade_next_button_pressed():
	blade_mesh.scale = Vector3(startSize)
	var tween = create_tween()
	tween.tween_property(blade_mesh,"scale",Vector3(.57,.57,.57), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	bladeIndex += 1
	tween.tween_property(blade_mesh,"scale",Vector3(.5,.5,.5), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	pass # Replace with function body.


func _on_blade_prev_button_pressed():
	blade_mesh.scale = Vector3(startSize)
	var tween = create_tween()
	tween.tween_property(blade_mesh,"scale",Vector3(.57,.57,.57), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	bladeIndex -= 1
	tween.tween_property(blade_mesh,"scale",Vector3(.5,.5,.5), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	pass # Replace with function body.


func _on_hilt_next_button_pressed():
	hilt_mesh.scale = Vector3(startSize)
	var tween = create_tween()
	tween.tween_property(hilt_mesh,"scale",Vector3(.67,.67,.67), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	hiltIndex += 1
	tween.tween_property(hilt_mesh,"scale",Vector3(.6,.6,.6), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	pass # Replace with function body.


func _on_hilt_prev_button_pressed():
	hilt_mesh.scale = Vector3(startSize)
	var tween = create_tween()
	tween.tween_property(hilt_mesh,"scale",Vector3(.67,.67,.67), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	hiltIndex -= 1
	tween.tween_property(hilt_mesh,"scale",Vector3(.6,.6,.6), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	pass # Replace with function body.


func _on_handle_next_button_pressed():
	handle_mesh.scale = Vector3(startSize)
	var tween = create_tween()
	tween.tween_property(handle_mesh,"scale",Vector3(.57,.57,.57), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	handleIndex -= 1
	tween.tween_property(handle_mesh,"scale",Vector3(.5,.5,.5), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	pass # Replace with function body.


func _on_handle_prev_button_pressed():
	handle_mesh.scale = Vector3(startSize)
	var tween = create_tween()
	tween.tween_property(handle_mesh,"scale",Vector3(.57,.57,.57), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	handleIndex -= 1
	tween.tween_property(handle_mesh,"scale",Vector3(.5,.5,.5), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	pass # Replace with function body.


func _on_pummel_next_button_pressed():
	pummel_mesh.scale = Vector3(startSize)
	var tween = create_tween()
	tween.tween_property(pummel_mesh,"scale",Vector3(.57,.57,.57), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	pummelIndex += 1
	tween.tween_property(pummel_mesh,"scale",Vector3(.5,.5,.5), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	pass # Replace with function body.


func _on_pummel_prev_button_pressed():
	pummel_mesh.scale = Vector3(startSize)
	var tween = create_tween()
	tween.tween_property(pummel_mesh,"scale",Vector3(.57,.57,.57), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	pummelIndex -= 1
	tween.tween_property(pummel_mesh,"scale",Vector3(.5,.5,.5), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)



func _on_panel_gui_input(event):
	if event is InputEvent:
		if Input.is_action_just_pressed("Right_Click"):
			print("Blade")
			color_pick_blade.visible = true
			color_pick_handle.visible = false
			color_pick_hilt.visible = false
			color_pick_pummel.visible = false
			color_pick_blade.position = get_viewport().get_mouse_position() + colorPickPos
	pass # Replace with function body.

func _on_hilt_area_gui_input(event):
	if event is InputEvent:
		if Input.is_action_just_pressed("Right_Click"):
			print("Hilt")
			color_pick_hilt.visible = true
			color_pick_handle.visible = false
			color_pick_blade.visible = false
			color_pick_pummel.visible = false
			color_pick_hilt.position = get_viewport().get_mouse_position() + colorPickPos
	pass # Replace with function body.

func _on_handle_area_gui_input(event):
	if event is InputEvent:
		if Input.is_action_just_pressed("Right_Click"):
			print("Handle")
			color_pick_handle.visible = true
			color_pick_hilt.visible = false
			color_pick_blade.visible = false
			color_pick_pummel.visible = false
			color_pick_handle.position = get_viewport().get_mouse_position() + colorPickPos
	pass # Replace with function body.
	
func _on_pummel_area_gui_input(event):
	if event is InputEvent:
		if Input.is_action_just_pressed("Right_Click"):
			print("Pummel")
			color_pick_pummel.visible = true
			color_pick_handle.visible = false
			color_pick_blade.visible = false
			color_pick_hilt.visible = false
			color_pick_pummel.position = get_viewport().get_mouse_position() + colorPickPos
	pass # Replace with function body.

func _on_hud_gui_input(event):
	if event is InputEvent:
		if Input.is_action_just_pressed("Left_Click") or Input.is_action_just_pressed("Right_Click"):
			color_pick_blade.visible = false
			color_pick_hilt.visible = false
			color_pick_pummel.visible = false
			color_pick_handle.visible = false
	pass # Replace with function body.






