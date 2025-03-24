#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name StopPanelContainer extends PanelContainer

# TODO 游戏暂停界面 ===============>信 号<===============
#region 信号

#endregion

# TODO 游戏暂停界面 ===============>常 量<===============
#region 常量

#endregion

# TODO 游戏暂停界面 ===============>变 量<===============
#region 变量

#endregion

# TODO 游戏暂停界面 ===============>虚方法<===============
#region 常用的虚方法
func _enter_tree() -> void:
	get_tree().paused = true

func _exit_tree() -> void:
	get_tree().paused = false
#endregion

# TODO 游戏暂停界面 ===============>信号链接方法<===============
#region 信号链接方法
func _on_continue_button_pressed() -> void:
	queue_free()

func _on_settings_button_pressed() -> void:
	var setting_v_box_container : SettingVBoxContainer = preload("res://scene/ui/setting_v_box_container.tscn").instantiate()
	Global.current_ui_ex.add_child(setting_v_box_container)

func _on_back_button_pressed() -> void:
	SceneLoader.load_scene_of_const("World", "Main")
#endregion

# TODO 游戏暂停界面 ===============>工具方法<===============
#region 工具方法

#endregion
