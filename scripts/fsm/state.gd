#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name State extends Node

# TODO 状态接口 ===============>信 号<===============
#region 信号
@warning_ignore("unused_signal")
signal switch_state(state_name : String)
#endregion

# TODO 状态接口 ===============>信号链接方法<===============
#region 状态方法
func enter(): pass

func exit(): pass

func update(_delta : float): pass

func physics_update(_delta : float): pass
#endregion
