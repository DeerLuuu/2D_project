#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name World extends Node2D

# TODO 世界场景 ===============>信 号<===============
#region 信号

#endregion

# TODO 世界场景 ===============>常 量<===============
#region 常量
const STOP_PANEL_CONTAINER = preload("res://scene/ui/stop_panel_container.tscn")
#endregion

# TODO 世界场景 ===============>变 量<===============
#region 变量
@onready var uiex: CanvasLayer = %UIEX
#endregion

# TODO 世界场景 ===============>虚方法<===============
#region 常用的虚方法
func _init() -> void:
	pass

func _ready() -> void:
	Global.current_ui_ex = uiex


	var player : Player = preload("res://scene/player.tscn").instantiate()
	player.global_position = Vector2(400, 300)
	add_child(player)
	if Global.player_count == 2:
		var player_2 : Player = player.duplicate()
		player_2.is_player_two = true
		add_child(player_2)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("game_stop"):
		var stop_panel_container : StopPanelContainer = STOP_PANEL_CONTAINER.instantiate()
		uiex.add_child(stop_panel_container)

func _physics_process(_delta: float) -> void:
	pass

func _input(_event: InputEvent) -> void:
	pass

func _unhandled_input(_event: InputEvent) -> void:
	pass
#endregion

# TODO 世界场景 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 世界场景 ===============>工具方法<===============
#region 工具方法

#endregion
