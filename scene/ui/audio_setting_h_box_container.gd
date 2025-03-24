#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
@tool
class_name AudioSettingHBoxContainer extends HBoxContainer

# TODO 音频设置 ===============>信 号<===============
#region 信号

#endregion

# TODO 音频设置 ===============>常 量<===============
#region 常量

#endregion

# TODO 音频设置 ===============>变 量<===============
#region 变量
@onready var label: Label = $Label
@onready var h_slider: HSlider = $HSlider
@onready var check_button: CheckButton = $CheckButton

@export var label_text : String:
	set(v):
		label_text = v
		$Label.text = label_text

@export var bus : int = 0
#endregion

# TODO 音频设置 ===============>虚方法<===============
#region 常用的虚方法

#endregion

# TODO 音频设置 ===============>信号链接方法<===============
#region 信号链接方法
func _on_h_slider_value_changed(value: float) -> void:
	var db : float = linear_to_db(value)
	AudioServer.set_bus_volume_db(bus, db)

func _on_check_button_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(bus, toggled_on)
#endregion

# TODO 音频设置 ===============>工具方法<===============
#region 工具方法

#endregion
