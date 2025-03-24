#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name PlayerCamera extends Camera2D

# TODO 玩家相机 ===============>信 号<===============
#region 信号

#endregion

# TODO 玩家相机 ===============>常 量<===============
#region 常量

#endregion

# TODO 玩家相机 ===============>变 量<===============
#region 变量
var is_shake : bool = false
var shake_time : float
#endregion

# TODO 玩家相机 ===============>虚方法<===============
#region 常用的虚方法
func _init() -> void:
	pass

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if is_shake:
		shake_time += 1
		offset = lerp(
			offset,
			Vector2(
				sin(shake_time) * 10  * Global.camera_shake_level,
				cos(shake_time) * 10  * Global.camera_shake_level - 100
				),
			0.2)
	else :
		shake_time = 0
		offset = Vector2(0, -100)

	if not Global.has_player(): return

	if Global.players.size() == 1:
		global_position = Global.players[0].global_position
	elif Global.players.size() == 2:
		global_position = (Global.players[0].global_position + Global.players[1].global_position) / 2

		if Global.players[0].global_position.distance_to(Global.players[1].global_position) > 500:
			zoom = lerp(zoom, Vector2.ONE * 2.5, .05)
		else :
			zoom = lerp(zoom, Vector2.ONE * 3, .05)

func _physics_process(_delta: float) -> void:
	pass

func _input(_event: InputEvent) -> void:
	pass

func _unhandled_input(_event: InputEvent) -> void:
	pass
#endregion

# TODO 玩家相机 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 玩家相机 ===============>工具方法<===============
#region 工具方法
func camera_shake(_time : float) -> void:
	if not Global.camera_shake_enable: return
	is_shake = true
	get_tree().create_timer(_time).timeout.connect(func(): is_shake = false)

func ice_time(time_scale : float, _time : float) -> void:
	if not Global.ice_time_enable: return
	Engine.time_scale = time_scale
	get_tree().create_timer(_time, true, false, true).timeout.connect(func(): Engine.time_scale = 1)
#endregion
