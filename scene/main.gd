#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name Main extends Node2D

# TODO 主场景 ===============>信 号<===============
#region 信号

#endregion

# TODO 主场景 ===============>常 量<===============
#region 常量

#endregion

# TODO 主场景 ===============>变 量<===============
#region 变量
@onready var uiex: CanvasLayer = %UIEX

#endregion

# TODO 主场景 ===============>虚方法<===============
#region 常用的虚方法
func _init() -> void:
	pass

func _ready() -> void:
	Global.current_ui_ex = uiex
	Global.players = []

func _process(_delta: float) -> void:
	pass

func _physics_process(_delta: float) -> void:
	pass

func _input(_event: InputEvent) -> void:
	pass

func _unhandled_input(_event: InputEvent) -> void:
	pass
#endregion

# TODO 主场景 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 主场景 ===============>工具方法<===============
#region 工具方法

#endregion
