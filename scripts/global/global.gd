#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
extends Node

# TODO 全局单例 ===============>信 号<===============
#region 信号

#endregion

# TODO 全局单例 ===============>常 量<===============
#region 常量

#endregion

# TODO 全局单例 ===============>变 量<===============
#region 变量
var players : Array = []
var current_ui_ex : CanvasLayer
var player_count : int

# 设置相关的变量
var camera_shake_enable : bool = true
var camera_shake_level : int = 1
var ice_time_enable : bool = true
var hit_label_enable : bool = true:
	set(v):
		hit_label_enable = v
		if not hit_label_enable:
			hit_label_time = 0.
var hit_label_time : float
var frame_show_enable : bool = false:
	set(v):
		frame_show_enable = v
		SceneLoader.frame_label.visible = frame_show_enable
#endregion

# TODO 全局单例 ===============>虚方法<===============
#region 常用的虚方法

#endregion

# TODO 全局单例 ===============>信号链接方法<===============
#region 信号链接方法
func _on_player_is_dead(player : Player) -> void:
	players.erase(player)

	if players.is_empty():
		var game_over : GameOverPanelContainer = preload("res://scene/ui/game_over_panel_container.tscn").instantiate()
		current_ui_ex.add_child(game_over)
#endregion

# TODO 全局单例 ===============>工具方法<===============
#region 工具方法
func has_player() -> bool:
	return not players.is_empty()
#endregion
