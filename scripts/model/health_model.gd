#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name HealthModel extends Node

# TODO 血量模块 ===============>信 号<===============
#region 信号
signal health_update(current_health : float, max_health : float)
#endregion

# TODO 血量模块 ===============>常 量<===============
#region 常量

#endregion

# TODO 血量模块 ===============>变 量<===============
#region 变量
@export var max_health : float
var current_health : float:
	set(v):
		current_health = v

		if current_health <= 0:
			current_health = 0
		if current_health >= max_health:
			current_health = max_health

		health_update.emit(current_health, max_health)
#endregion

# TODO 血量模块 ===============>虚方法<===============
#region 常用的虚方法

#endregion

# TODO 血量模块 ===============>工具方法<===============
#region 工具方法
func reset_health() -> void:
	current_health = max_health
#endregion
