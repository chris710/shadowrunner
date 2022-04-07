extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var viewportWidth = get_viewport().size.x
	var viewportHeight = get_viewport().size.y
	var scale = viewportWidth / texture.get_size().x
	set_position(Vector2(viewportWidth/2, viewportHeight/2))
	set_scale(Vector2(scale, scale))

func _on_root_resize():
	var viewportWidth = get_viewport().size.x
	var viewportHeight = get_viewport().size.y
	var scale = viewportWidth / texture.get_size().x
	set_position(Vector2(viewportWidth/2, viewportHeight/2))
	set_scale(Vector2(scale, scale))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
