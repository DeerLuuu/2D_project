#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name MenuButtonGroup extends VBoxContainer

# TODO 主菜单按钮组 ===============>信 号<===============
#region 信号

#endregion

# TODO 主菜单按钮组 ===============>常 量<===============
#region 常量

#endregion

# TODO 主菜单按钮组 ===============>变 量<===============
#region 变量

#endregion

# TODO 主菜单按钮组 ===============>虚方法<===============
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

# TODO 主菜单按钮组 ===============>信号链接方法<===============
#region 信号链接方法
func _on_start_button_pressed() -> void:
	var mode_panel_container : ModePanelContainer = preload("res://scene/ui/mode_panel_container.tscn").instantiate()
	Global.current_ui_ex.add_child(mode_panel_container)

func _on_continue_button_pressed() -> void:
	print("继续游戏")


func _on_settings_button_pressed() -> void:
	var setting_v_box_container : SettingVBoxContainer = preload("res://scene/ui/setting_v_box_container.tscn").instantiate()
	Global.current_ui_ex.add_child(setting_v_box_container)


func _on_exit_button_pressed() -> void:
	get_tree().quit()
#endregion

# TODO 主菜单按钮组 ===============>工具方法<===============
#region 工具方法

#endregion
