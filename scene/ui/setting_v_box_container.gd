#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name SettingVBoxContainer extends VBoxContainer

# TODO 设置界面 ===============>信 号<===============
#region 信号

#endregion

# TODO 设置界面 ===============>常 量<===============
#region 常量

#endregion

# TODO 设置界面 ===============>变 量<===============
#region 变量
@onready var tab_container: TabContainer = $TabContainer

#endregion

# TODO 设置界面 ===============>虚方法<===============
#region 常用的虚方法
func _enter_tree() -> void:
	get_tree().paused = true

func _exit_tree() -> void:
	get_tree().paused = false

func _ready() -> void:
	tab_container.set_tab_title(0, "音频")
	tab_container.set_tab_title(1, "视频")
	tab_container.set_tab_title(2, "按键")
#endregion

# TODO 设置界面 ===============>信号链接方法<===============
#region 信号链接方法
func _on_back_button_pressed() -> void:
	queue_free()

# 设置界面：屏幕模式
func _on_screen_mode_option_button_item_selected(index: int) -> void:
	match index:
		0:
			get_window().borderless = false
			get_window().mode = Window.MODE_WINDOWED
		1:
			get_window().borderless = false
			get_window().mode = Window.MODE_FULLSCREEN
		2:
			get_window().borderless = true
			get_window().mode = Window.MODE_MAXIMIZED

# 设置界面：震动模式
func _on_shake_check_button_toggled(toggled_on: bool) -> void:
	Global.camera_shake_enable = toggled_on

# 设置界面：震动幅度
func _on_shake_h_slider_value_changed(value: float) -> void:
	Global.camera_shake_level = 1. + value

# 设置界面：时间冻结模式
func _on_ice_check_button_toggled(toggled_on: bool) -> void:
	Global.ice_time_enable = toggled_on

# 设置界面：漂浮文字设置
func _on_flow_label_check_button_toggled(toggled_on: bool) -> void:
	Global.hit_label_enable = toggled_on

# 设置界面：漂浮文字时间
func _on_flow_label_h_slider_value_changed(value: float) -> void:
	Global.hit_label_time = value

# 设置界面：帧数显示
func _on_show_frame_check_button_toggled(toggled_on: bool) -> void:
	Global.frame_show_enable = toggled_on
#endregion

# TODO 设置界面 ===============>工具方法<===============
#region 工具方法

#endregion
