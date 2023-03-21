extends Control

signal item_selected(index: int)
 
@onready var ui_items: ItemList = $ItemList

## [ { name String, icon: Texture2D } ]
var _items: Array[Dictionary]

var selected: int = 0 : 
	set(index):
		if index < _items.size() and index >= 0:
			selected = index
		else:
			print("Failed to select ", index, " out of range! ", _items.size()-1)


func add_item(item_name: String, icon: Texture2D):
	_items.append({'name': item_name, 'icon': icon})
	ui_items.add_item(item_name, icon)

## if the index exits, returns {name: String, icon: Texture2D}
## else returns {name: null, icon: null}
func get_item(index: int) -> Dictionary:
	if index >= _items.size() or index < 0:
		return {'name': null, 'icon': null}
	else:
		return _items[index]

func remove_item(index: int):
	if index < _items.size() and index >= 0:
		_items.remove_at(index)
		ui_items.remove_item(index)

func clear_items():
	_items.clear()
	ui_items.clear()

## just in case
func refresh():
	ui_items.clear()
	for x in _items:
		ui_items.add_item(x['name'], x['icon'])

func _on_item_selected(index):
	if index < _items.size() and index >= 0:
		selected = index
		item_selected.emit(selected)

func _ready():
	add_item('1', null)
	add_item('2', null)
