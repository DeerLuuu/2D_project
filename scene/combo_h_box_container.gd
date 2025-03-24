#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
extends HBoxContainer

# TODO 玩家连击漂浮文字容器 ===============>信 号<===============
#region 信号

#endregion

# TODO 玩家连击漂浮文字容器 ===============>常 量<===============
#region 常量

#endregion

# TODO 玩家连击漂浮文字容器 ===============>变 量<===============
#region 变量
@onready var player_combo_label_1: Label = %PlayerComboLabel1
@onready var player_combo_label_2: Label = %PlayerComboLabel2
var players : Array
#endregion

# TODO 玩家连击漂浮文字容器 ===============>虚方法<===============
#region 常用的虚方法
func _ready() -> void:
	players = get_tree().get_nodes_in_group("Player")

	for p : Player in players:
		p.combo_update.connect(_on_player_combo_update.bind(p))
#endregion

# TODO 玩家连击漂浮文字容器 ===============>信号链接方法<===============
#region 信号链接方法
func _on_player_combo_update(combo : float, player : Player) -> void:
	var tween : Tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC).set_parallel()
	if player.is_player_two:
		player_combo_label_2.modulate.a = 1
		if combo < 2:
			tween.tween_property(player_combo_label_2, "modulate:a", 0, 0.5)
			await tween.finished
			player_combo_label_2.hide()
			return
		player_combo_label_2.show()
		player_combo_label_2.text = "%s连击" % combo
		tween.tween_property(player_combo_label_2, "label_settings:font_size", 60, .1)
		tween.chain().tween_property(player_combo_label_2, "label_settings:font_size", 48, .1)
		return
	player_combo_label_1.modulate.a = 1
	if combo < 2:
		tween.tween_property(player_combo_label_1, "modulate:a", 0, 0.5)
		await tween.finished
		player_combo_label_1.hide()
		return
	player_combo_label_1.show()
	player_combo_label_1.text = "%s连击" % combo
	tween.tween_property(player_combo_label_1, "label_settings:font_size", 60, .1)
	tween.chain().tween_property(player_combo_label_1, "label_settings:font_size", 48, .1)
#endregion

# TODO 玩家连击漂浮文字容器 ===============>工具方法<===============
#region 工具方法

#endregion
