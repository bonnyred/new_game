extends Area2D

@onready var game_manager = %GameManager
@onready var tilemap: TileMap = $".."

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))
	
func _on_body_entered(body):
	if body.name == "Player":
		print("Checkpoint by: ", body.name)
		game_manager.checkpoint(body.global_position)
		var local_pos = tilemap.to_local(body.global_position)
		var cell = tilemap.local_to_map(local_pos)
		var new_tile_id = 4  
		var atlas_coords = Vector2i(9, 5)
		tilemap.set_cell(1, cell, 0, atlas_coords, 0)
