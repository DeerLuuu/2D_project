#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name HitLabel extends Label

# TODO 受伤漂浮文字 ===============>信 号<===============
#region 信号

#endregion

# TODO 受伤漂浮文字 ===============>常 量<===============
#region 常量

#endregion

# TODO 受伤漂浮文字 ===============>变 量<===============
#region 变量

#endregion

# TODO 受伤漂浮文字 ===============>虚方法<===============
#region 常用的虚方法
func _ready() -> void:
	pivot_offset = size / 2 * scale.x
	if Global.hit_label_time > 0:
		var tween : Tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC).set_parallel()
		tween.tween_property(self, "label_settings:font_size", 36, .5 * Global.hit_label_time)
		tween.chain().tween_property(self, "label_settings:font_size", 12, .5 * Global.hit_label_time)
		tween.tween_property(self, "global_position:y", global_position.y - 20, 1. * Global.hit_label_time)
		tween.tween_property(self, "modulate:a", 0, 1. * Global.hit_label_time)
		tween.chain().tween_callback(queue_free)
	else :
		queue_free()
#endregion

# TODO 受伤漂浮文字 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 受伤漂浮文字 ===============>工具方法<===============
#region 工具方法

#endregion
