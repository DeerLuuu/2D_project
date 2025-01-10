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
var players : Array
#endregion

# TODO 玩家相机 ===============>虚方法<===============
#region 常用的虚方法
func _init() -> void:
	pass

func _ready() -> void:
	players = get_tree().get_nodes_in_group("Player")
	for player in players:
		if player is not Player:
			players.erase(player)

func _process(_delta: float) -> void:
	if players.size() == 1:
		global_position = players[0].global_position
	elif players.size() == 2:
		global_position = (players[0].global_position + players[1].global_position) / 2

		if players[0].global_position.distance_to(players[1].global_position) > 500:
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

#endregion
