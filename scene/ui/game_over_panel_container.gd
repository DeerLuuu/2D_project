#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name GameOverPanelContainer extends PanelContainer

# TODO 游戏结束界面 ===============>信 号<===============
#region 信号

#endregion

# TODO 游戏结束界面 ===============>常 量<===============
#region 常量

#endregion

# TODO 游戏结束界面 ===============>变 量<===============
#region 变量

#endregion

# TODO 游戏结束界面 ===============>虚方法<===============
#region 常用的虚方法
func _enter_tree() -> void:
	get_tree().paused = true

func _exit_tree() -> void:
	get_tree().paused = false
#endregion

# TODO 游戏结束界面 ===============>信号链接方法<===============
#region 信号链接方法
func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()
	queue_free()

func _on_back_button_pressed() -> void:
	SceneLoader.load_scene_of_const("World", "Main")
#endregion

# TODO 游戏结束界面 ===============>工具方法<===============
#region 工具方法

#endregion
