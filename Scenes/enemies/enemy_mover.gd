extends PathFollow2D

enum State {walking, damaged}
var state = State.walking

@onready var spawner := get_parent() as EnemyPath
func _ready():
	add_to_group("enemy")

func _process(_delta):
	if state == State.walking:
		#Move
		progress_ratio += 0.0005
		if progress_ratio == 1:
			finished_path()
			return
		#Flip
		var angle = int(rotation_degrees) % 360
		if angle > 180:
			angle -= 360
		$Sprite2D.flip_v = abs(angle) > 90

func finished_path():
	spawner.active_enemies -= 1
	queue_free()
