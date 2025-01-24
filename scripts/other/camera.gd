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
var has_player : bool
var is_shake : bool = false
var shake_time : float
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
		else :
			player.is_dead.connect(_on_player_is_dead)

func _process(_delta: float) -> void:
	if is_shake:
		shake_time += 1
		offset = lerp(offset, Vector2(sin(shake_time) * 10, cos(shake_time) * 10 - 100), 0.2)
	else :
		shake_time = 0
		offset = Vector2(0, -100)
	if players.size() > 0:
		has_player = true
	else :
		has_player = false
	if not has_player: return
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
func _on_player_is_dead(player : Player) -> void:
	players.erase(player)
#endregion

# TODO 玩家相机 ===============>工具方法<===============
#region 工具方法
func camera_shake(_time : float) -> void:
	is_shake = true
	get_tree().create_timer(_time).timeout.connect(func(): is_shake = false)

func ice_time(time_scale : float, _time : float) -> void:
	Engine.time_scale = time_scale
	get_tree().create_timer(_time, true, false, true).timeout.connect(func(): Engine.time_scale = 1)
#endregion
