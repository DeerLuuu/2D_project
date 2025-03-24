#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name ModePanelContainer extends PanelContainer

# TODO 模式选择界面 ===============>信 号<===============
#region 信号

#endregion

# TODO 模式选择界面 ===============>常 量<===============
#region 常量

#endregion

# TODO 模式选择界面 ===============>变 量<===============
#region 变量

#endregion

# TODO 模式选择界面 ===============>虚方法<===============
#region 常用的虚方法
func _init() -> void:
	pass

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

func _physics_process(_delta: float) -> void:
	pass

func _input(_event: InputEvent) -> void:
	pass

func _unhandled_input(_event: InputEvent) -> void:
	pass
#endregion

# TODO 模式选择界面 ===============>信号链接方法<===============
#region 信号链接方法
func _on_sigle_player_button_pressed() -> void:
	Global.player_count = 1
	SceneLoader.load_scene_of_const("Main", "World")


func _on_double_player_button_pressed() -> void:
	Global.player_count = 2
	SceneLoader.load_scene_of_const("Main", "World")


func _on_back_button_pressed() -> void:
	queue_free()
#endregion

# TODO 模式选择界面 ===============>工具方法<===============
#region 工具方法

#endregion
