extends Node2D

@onready var loadingIcon: AnimatedSprite2D = $CanvasLayer/CenterContainer/LoadingIcon;
@onready var loginBtn: TextureButton = $CanvasLayer/CenterContainer/TitleContainer/LoginBtn;
@onready var openingAnimationPlayer = $CanvasLayer/OpeningAnimationPlayer

func _ready():
	loadingIcon.visible = false;
	Twitch.OnSucess.connect(onTwitchConnectionSuccess);

func _on_button_pressed() -> void:
	Twitch.authenticate();
	loadingIcon.visible = true;
	loginBtn.visible = false;

func onTwitchConnectionSuccess():
	get_tree().change_scene_to_file('res://Scenes/Climb/Climb.tscn');


func _on_splash_screen_on_animation_end():
	openingAnimationPlayer.play("Start");
