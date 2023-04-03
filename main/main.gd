extends Control

@onready var t = $hud/Control/left/parts as Tree
@onready var p = $world/parts
@onready var ui_variants = $hud/Control/right/variants as Tree

#var parts = []

func _ready():
	refresh()
	
	ui_variants.create_item().set_text(0, 'root')
	
	var type = ui_variants.create_item()
	type.set_text(0, 'Sword Type')
	
	var a = ui_variants.create_item(type)
	a.set_text(0, 'Fire Sword')
	
	a = ui_variants.create_item(type)
	a.set_text(0, 'Ice Sword')


func refresh():
	t.clear()
	t.create_item() # create root
	
	for x in p.get_children(true):
		if x is MeshInstance3D:
			var part = t.create_item()
			part.collapsed = true
			part.set_text(0, x.name)
			var m = x.mesh as Mesh
			for i in m.get_surface_count():
				var mat = m.surface_get_material(i) as BaseMaterial3D
				if not mat is BaseMaterial3D:
					mat = StandardMaterial3D.new()
					m.surface_set_material(i, mat)
				var option_color = t.create_item(part)
				option_color.set_text(0, 'Color')
#				option_color.set_text(1, str(mat.albedo_color))
				option_color.set_editable(1, true)
				
				var w = t.create_item(option_color)
				w.set_text(0,'R')
				w.set_cell_mode(1, TreeItem.CELL_MODE_RANGE)
				w.set_range(1, mat.albedo_color.r)
				w.set_editable(1, true)
				
				w = t.create_item(option_color)
				w.set_text(0,'G')
				w.set_cell_mode(1, TreeItem.CELL_MODE_RANGE)
				w.set_range(1, mat.albedo_color.g)
				w.set_editable(1, true)
				
				w = t.create_item(option_color)
				w.set_text(0,'B')
				w.set_cell_mode(1, TreeItem.CELL_MODE_RANGE)
				w.set_range(1, mat.albedo_color.b)
				w.set_editable(1, true)
				
				w = t.create_item(option_color)
				w.set_text(0,'A')
				w.set_cell_mode(1, TreeItem.CELL_MODE_RANGE)
				w.set_range(1, mat.albedo_color.a)
				w.set_editable(1, true)
				
