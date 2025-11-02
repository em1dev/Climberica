extends CanvasLayer

signal OnAnimationEnd;

func _ready():
	visible = true;

func onEnd():
	OnAnimationEnd.emit()

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free();

func _input(event: InputEvent):
	if event.is_pressed():
		onEnd();
		queue_free();
