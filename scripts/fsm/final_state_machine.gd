#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name FSM extends Node

# TODO 有限状态机 ===============>信 号<===============
#region 信号

#endregion

# TODO 有限状态机 ===============>常 量<===============
#region 常量

#endregion

# TODO 有限状态机 ===============>变 量<===============
#region 变量
@export var init_state : State
var states : Dictionary
var current_state : State
#endregion

# TODO 有限状态机 ===============>虚方法<===============
#region 常用的虚方法
func _ready() -> void:
	for s in get_children():
		if s is State:
			states[s.name.to_upper()] = s
			s.switch_state.connect(_on_state_switch)

	if init_state:
		init_state.enter()
		current_state = init_state

func _process(_delta: float) -> void:
	if current_state:
		current_state.update(_delta)

func _physics_process(_delta: float) -> void:
	if current_state:
		current_state.physics_update(_delta)
#endregion

# TODO 有限状态机 ===============>信号链接方法<===============
#region 信号链接方法
func _on_state_switch(state_name : String) -> void:
	if current_state.name.to_upper() == state_name.to_upper():
		return

	var new_state : State = states[state_name.to_upper() + "STATE"]

	if current_state:
		current_state.exit()

	new_state.enter()
	current_state = new_state
#endregion

# TODO 有限状态机 ===============>工具方法<===============
#region 工具方法

#endregion
