#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
extends Label

# TODO name ===============>信 号<===============
#region 信号

#endregion

# TODO name ===============>常 量<===============
#region 常量

#endregion

# TODO name ===============>变 量<===============
#region 变量

#endregion

# TODO name ===============>虚方法<===============
#region 常用的虚方法
func _process(delta: float) -> void:
	text = "当前帧数：%s" % Engine.get_frames_per_second()
#endregion

# TODO name ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO name ===============>工具方法<===============
#region 工具方法

#endregion
