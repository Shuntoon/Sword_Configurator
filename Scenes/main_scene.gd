extends Node3D

@onready var weaponParts = preload("res://Utility/WeaponParts.tres")
@onready var blade_mesh: MeshInstance3D = $SwordContainter/Blade/BladeSpawn/BladeMesh
@onready var hilt_mesh: MeshInstance3D = $SwordContainter/Hilt/HiltSpawn/HiltMesh
@onready var handle_mesh: MeshInstance3D = $SwordContainter/Handle/HandleSpawn/HandleMesh
@onready var pummel_mesh: MeshInstance3D = $SwordContainter/Pummel/PummelSpawn/PummelMesh

@onready var color_pick_blade = $ColorPickBlade
@onready var color_pick_hilt = $ColorPickHilt
@onready var color_pick_handle = $ColorPickHandle
@onready var color_pick_pummel = $ColorPickPummel
@onready var inventory = $HUD/Inventory
@onready var inventory_type: Label = $HUD/Inventory/Label


@export var transitionSpeed = .2
@export var startSize = Vector3(.1,.1,.1)
@export var colorPickPos = Vector2(200,0)

var bladeIndex = 0
var hiltIndex = 0
var handleIndex = 0
var pummelIndex = 0

var bladeColor: Color = Color.DARK_GRAY
var hiltColor: Color = Color.GOLD
var handleColor: Color = Color.DARK_RED
var pummelColor: Color = Color.GOLD

var _selected_type: String = '' :
	set(v):
		_selected_type = v
		inventory_type.text = "Selected: " + _selected_type

# Called when the node enters the scene tree for the first time.
func _ready():
	inventory.clear_items()
	var i = 0
	for x in weaponParts.bladeMeshes:
		i += 1
		inventory.add_item(str(i), null)
	_selected_type = 'blade'
	load_sword()

func _exit_tree():
	save_sword()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
	bladeIndex = _rollover(bladeIndex + 1, weaponParts.bladeMeshes.size() - 1)
	tween.tween_property(blade_mesh,"scale",Vector3(.5,.5,.5), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	pass # Replace with function body.


func _on_blade_prev_button_pressed():
	blade_mesh.scale = Vector3(startSize)
	var tween = create_tween()
	tween.tween_property(blade_mesh,"scale",Vector3(.57,.57,.57), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	bladeIndex = _rollover(bladeIndex - 1, weaponParts.bladeMeshes.size() - 1)
	tween.tween_property(blade_mesh,"scale",Vector3(.5,.5,.5), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	pass # Replace with function body.


func _on_hilt_next_button_pressed():
	hilt_mesh.scale = Vector3(startSize)
	var tween = create_tween()
	tween.tween_property(hilt_mesh,"scale",Vector3(.67,.67,.67), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	hiltIndex = _rollover(hiltIndex + 1, weaponParts.HiltMeshes.size() - 1)
	tween.tween_property(hilt_mesh,"scale",Vector3(.6,.6,.6), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	pass # Replace with function body.


func _on_hilt_prev_button_pressed():
	hilt_mesh.scale = Vector3(startSize)
	var tween = create_tween()
	tween.tween_property(hilt_mesh,"scale",Vector3(.67,.67,.67), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	hiltIndex = _rollover(hiltIndex - 1, weaponParts.HiltMeshes.size() - 1)
	tween.tween_property(hilt_mesh,"scale",Vector3(.6,.6,.6), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	pass # Replace with function body.


func _on_handle_next_button_pressed():
	handle_mesh.scale = Vector3(startSize)
	var tween = create_tween()
	tween.tween_property(handle_mesh,"scale",Vector3(.57,.57,.57), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	handleIndex = _rollover(handleIndex + 1, weaponParts.HandleMeshes.size() - 1)
	tween.tween_property(handle_mesh,"scale",Vector3(.5,.5,.5), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	pass # Replace with function body.


func _on_handle_prev_button_pressed():
	handle_mesh.scale = Vector3(startSize)
	var tween = create_tween()
	tween.tween_property(handle_mesh,"scale",Vector3(.57,.57,.57), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	handleIndex = _rollover(handleIndex + 1, weaponParts.HandleMeshes.size() - 1)
	tween.tween_property(handle_mesh,"scale",Vector3(.5,.5,.5), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	pass # Replace with function body.


func _on_pummel_next_button_pressed():
	pummel_mesh.scale = Vector3(startSize)
	var tween = create_tween()
	tween.tween_property(pummel_mesh,"scale",Vector3(.57,.57,.57), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	pummelIndex = _rollover(pummelIndex + 1, weaponParts.PummelMeshes.size() - 1)
	tween.tween_property(pummel_mesh,"scale",Vector3(.5,.5,.5), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	pass # Replace with function body.


func _on_pummel_prev_button_pressed():
	pummel_mesh.scale = Vector3(startSize)
	var tween = create_tween()
	tween.tween_property(pummel_mesh,"scale",Vector3(.57,.57,.57), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	pummelIndex = _rollover(pummelIndex - 1, weaponParts.PummelMeshes.size() - 1)
	tween.tween_property(pummel_mesh,"scale",Vector3(.5,.5,.5), transitionSpeed).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)

func _rollover(value: int, max: int) -> int:
	if value > max:
		return 0
	elif value < 0:
		return max
	else:
		return value

func _on_panel_gui_input(_event: InputEvent):
	if Input.is_action_just_pressed("Right_Click"):
		print("Blade")
		color_pick_blade.visible = true
		color_pick_handle.visible = false
		color_pick_hilt.visible = false
		color_pick_pummel.visible = false
		color_pick_blade.position = get_viewport().get_mouse_position() + colorPickPos
	elif Input.is_action_just_pressed("Left_Click"):
		if _selected_type != 'blade':
			_selected_type = 'blade'
			inventory.clear_items()
			var i = 0
			for x in weaponParts.bladeMeshes:
				i += 1
				inventory.add_item(str(i), null)

func _on_hilt_area_gui_input(_event: InputEvent):
	if Input.is_action_just_pressed("Right_Click"):
		print("Hilt")
		color_pick_hilt.visible = true
		color_pick_handle.visible = false
		color_pick_blade.visible = false
		color_pick_pummel.visible = false
		color_pick_hilt.position = get_viewport().get_mouse_position() + colorPickPos
	elif Input.is_action_just_pressed("Left_Click"):
		if _selected_type != 'hilt':
			_selected_type = 'hilt'
			inventory.clear_items()
			var i = 0
			for x in weaponParts.HiltMeshes:
				i += 1
				inventory.add_item(str(i), null)

func _on_handle_area_gui_input(_event: InputEvent):
	if Input.is_action_just_pressed("Right_Click"):
		print("Handle")
		color_pick_handle.visible = true
		color_pick_hilt.visible = false
		color_pick_blade.visible = false
		color_pick_pummel.visible = false
		color_pick_handle.position = get_viewport().get_mouse_position() + colorPickPos
	elif Input.is_action_just_pressed("Left_Click"):
		if _selected_type != 'handle':
			_selected_type = 'handle'
			inventory.clear_items()
			var i = 0
			for x in weaponParts.HandleMeshes:
				i += 1
				inventory.add_item(str(i), null)
	
func _on_pummel_area_gui_input(_event: InputEvent):
	if Input.is_action_just_pressed("Right_Click"):
		print("Pummel")
		color_pick_pummel.visible = true
		color_pick_handle.visible = false
		color_pick_blade.visible = false
		color_pick_hilt.visible = false
		color_pick_pummel.position = get_viewport().get_mouse_position() + colorPickPos
	elif Input.is_action_just_pressed("Left_Click"):
		if _selected_type != 'pummel':
			_selected_type = 'pummel'
			inventory.clear_items()
			var i = 0
			for x in weaponParts.PummelMeshes:
				i += 1
				inventory.add_item(str(i), null)

func _on_hud_gui_input(_event: InputEvent):
	if Input.is_action_just_pressed("Left_Click") or Input.is_action_just_pressed("Right_Click"):
		color_pick_blade.visible = false
		color_pick_hilt.visible = false
		color_pick_pummel.visible = false
		color_pick_handle.visible = false
	elif Input.is_action_pressed("Left_Click"):
		Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	elif Input.mouse_mode != Input.MOUSE_MODE_VISIBLE:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _on_inventory_item_selected(index: int):
	if _selected_type == 'pummel':
		pummel_mesh.scale = Vector3(startSize)
		var tween = create_tween()
		tween.tween_property(pummel_mesh,"scale",Vector3(.57,.57,.57), transitionSpeed)\
		.set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
		pummelIndex = index
		tween.tween_property(pummel_mesh,"scale",Vector3(.5,.5,.5), transitionSpeed)\
		.set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	elif _selected_type == 'handle':
		handle_mesh.scale = Vector3(startSize)
		var tween = create_tween()
		tween.tween_property(handle_mesh,"scale",Vector3(.57,.57,.57), transitionSpeed)\
		.set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
		handleIndex = index
		tween.tween_property(handle_mesh,"scale",Vector3(.5,.5,.5), transitionSpeed)\
		.set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	elif _selected_type == 'blade':
		blade_mesh.scale = Vector3(startSize)
		var tween = create_tween()
		tween.tween_property(blade_mesh,"scale",Vector3(.57,.57,.57), transitionSpeed)\
		.set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
		bladeIndex = index
		tween.tween_property(blade_mesh,"scale",Vector3(.5,.5,.5), transitionSpeed)\
		.set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
	elif _selected_type == 'hilt':
		hilt_mesh.scale = Vector3(startSize)
		var tween = create_tween()
		tween.tween_property(hilt_mesh,"scale",Vector3(.67,.67,.67), transitionSpeed)\
		.set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)
		hiltIndex = index
		tween.tween_property(hilt_mesh,"scale",Vector3(.6,.6,.6), transitionSpeed)\
		.set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_IN_OUT)

var save_file: String = 'user://save'

func save_sword():
	var f = FileAccess.open(save_file, FileAccess.WRITE)
	f.store_8(bladeIndex)
	f.store_8(hiltIndex)
	f.store_8(handleIndex)
	f.store_8(pummelIndex)
	
	f.store_float(bladeColor.r)
	f.store_float(bladeColor.g)
	f.store_float(bladeColor.b)

	f.store_float(hiltColor.r)
	f.store_float(hiltColor.g)
	f.store_float(hiltColor.b)

	f.store_float(handleColor.r)
	f.store_float(handleColor.g)
	f.store_float(handleColor.b)

	f.store_float(pummelColor.r)
	f.store_float(pummelColor.g)
	f.store_float(pummelColor.b)
	f.close()

func load_sword():
	if FileAccess.file_exists(save_file):
		var f = FileAccess.open(save_file, FileAccess.READ)

		bladeIndex = f.get_8()
		hiltIndex = f.get_8()
		handleIndex = f.get_8()
		pummelIndex = f.get_8()

		bladeColor.r = f.get_float()
		bladeColor.g = f.get_float()
		bladeColor.b = f.get_float()

		hiltColor.r = f.get_float()
		hiltColor.g = f.get_float()
		hiltColor.b = f.get_float()

		handleColor.r = f.get_float()
		handleColor.g = f.get_float()
		handleColor.b = f.get_float()

		pummelColor.r = f.get_float()
		pummelColor.g = f.get_float()
		pummelColor.b = f.get_float()
		f.close()
		
		color_pick_blade.get_node("Panel/ColorPickerButton").color = bladeColor
		color_pick_hilt.get_node("Panel/ColorPickerButton").color = hiltColor
		color_pick_handle.get_node("Panel/ColorPickerButton").color = handleColor
		color_pick_pummel.get_node("Panel/ColorPickerButton").color = pummelColor
