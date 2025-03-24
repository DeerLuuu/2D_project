#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
extends HBoxContainer

# TODO 角色状态UI容器 ===============>信 号<===============
#region 信号

#endregion

# TODO 角色状态UI容器 ===============>常 量<===============
#region 常量

#endregion

# TODO 角色状态UI容器 ===============>变 量<===============
#region 变量
@onready var player_one_bar: ProgressBar = %PlayerOneBar
@onready var player_two_bar: ProgressBar = %PlayerTwoBar
#endregion

# TODO 角色状态UI容器 ===============>虚方法<===============
#region 常用的虚方法
func _init() -> void:
	pass

func _ready() -> void:
	await $"../../..".ready
	player_one_bar.show()
	player_two_bar.show()

	if Global.players.size() == 1:
		player_two_bar.hide()

	for player : Player in Global.players:
		player.health_model.health_update.connect(_on_player_health_updata.bind(player))

func _process(_delta: float) -> void:
	pass

func _physics_process(_delta: float) -> void:
	pass

func _input(_event: InputEvent) -> void:
	pass

func _unhandled_input(_event: InputEvent) -> void:
	pass
#endregion

# TODO 角色状态UI容器 ===============>信号链接方法<===============
#region 信号链接方法
func _on_player_health_updata(health : float, max_health : float, player : Player) -> void:
	if player.is_player_two:
		player_two_bar.max_value = max_health
		player_two_bar.value = health
		return
	player_one_bar.max_value = max_health
	player_one_bar.value = health
#endregion

# TODO 角色状态UI容器 ===============>工具方法<===============
#region 工具方法

#endregion
