# PROTOTYPE - NOT FOR PRODUCTION
# Question: Does drawing short-lived ink trails that double as speed boosts and enemy bait create a fun courier loop?
# Date: 2026-03-28

extends Node2D

const PLAYFIELD: Rect2 = Rect2(140.0, 100.0, 980.0, 520.0)
const PLAYER_RADIUS: float = 14.0
const STAMP_RADIUS: float = 18.0
const BASE_SPEED: float = 220.0
const BOOST_SPEED: float = 340.0
const TRAIL_POINT_DISTANCE: float = 16.0
const TRAIL_LIFETIME: float = 4.8
const TRAIL_ATTRACTION_WINDOW: float = 1.8
const BOOST_RADIUS: float = 20.0
const START_POSITION: Vector2 = Vector2(230.0, 360.0)
const MAILBOX_SIZE: Vector2 = Vector2(76.0, 88.0)
const HEADLESS_TIMEOUT: float = 35.0
const RESULT_EXIT_DELAY: float = 1.4

class TrailPoint:
	var position: Vector2
	var age: float

	func _init(point_position: Vector2) -> void:
		position = point_position
		age = 0.0

class EraserData:
	var position: Vector2
	var speed: float
	var tint: Color

	func _init(start_position: Vector2, move_speed: float, color_tint: Color) -> void:
		position = start_position
		speed = move_speed
		tint = color_tint

var player_position: Vector2 = START_POSITION
var trail_points: Array[TrailPoint] = []
var erasers: Array[EraserData] = []
var stamp_positions: Array[Vector2] = [
	Vector2(360.0, 200.0),
	Vector2(680.0, 470.0),
	Vector2(910.0, 220.0),
]
var stamp_collected: Array[bool] = [false, false, false]
var mailbox_position: Vector2 = Vector2(1010.0, 560.0)
var mailbox_open: bool = false
var ink_budget_max: float = 4.0
var ink_budget: float = 4.0
var auto_mode: bool = false
var auto_targets: Array[Vector2] = []
var auto_index: int = 0
var elapsed_time: float = 0.0
var boost_time: float = 0.0
var drawing_time: float = 0.0
var eraser_contacts: int = 0
var run_complete: bool = false
var run_failed: bool = false
var exit_timer: float = 0.0

var hud_label: Label
var result_label: Label

func _ready() -> void:
	RenderingServer.set_default_clear_color(Color("fffdf5"))
	auto_mode = OS.has_feature("headless") or DisplayServer.get_name() == "headless"
	print("Paper Trail Express prototype booting. headless=%s" % auto_mode)
	_configure_input()
	_create_ui()
	_reset_run()
	queue_redraw()

func _physics_process(delta: float) -> void:
	if run_complete or run_failed:
		exit_timer += delta
		if exit_timer >= RESULT_EXIT_DELAY:
			get_tree().quit()
		return

	elapsed_time += delta
	if auto_mode and elapsed_time >= HEADLESS_TIMEOUT:
		run_failed = true
		result_label.text = "Headless demo timed out."
		result_label.visible = true
		_print_summary("PIVOT")
		return

	if Input.is_action_just_pressed(&"restart_run"):
		_reset_run()
		return

	var move_direction: Vector2 = _get_move_direction()
	var is_drawing: bool = _is_drawing()

	if is_drawing and ink_budget > 0.0:
		drawing_time += delta
		ink_budget = max(0.0, ink_budget - delta)
		_append_trail_point(player_position)
	else:
		ink_budget = min(ink_budget_max, ink_budget + delta * 0.75)

	var speed: float = BASE_SPEED
	if _is_on_fresh_ink(player_position):
		speed = BOOST_SPEED
		boost_time += delta

	player_position += move_direction * speed * delta
	player_position.x = clampf(player_position.x, PLAYFIELD.position.x + PLAYER_RADIUS, PLAYFIELD.end.x - PLAYER_RADIUS)
	player_position.y = clampf(player_position.y, PLAYFIELD.position.y + PLAYER_RADIUS, PLAYFIELD.end.y - PLAYER_RADIUS)

	_update_trail(delta)
	_update_erasers(delta)
	_collect_stamps()
	_update_mailbox()
	_refresh_hud()
	queue_redraw()

func _draw() -> void:
	draw_rect(Rect2(Vector2.ZERO, get_viewport_rect().size), Color("fffdf5"), true)
	_draw_notebook()
	_draw_mailbox()
	_draw_stamps()
	_draw_trails()
	_draw_erasers()
	draw_circle(player_position, PLAYER_RADIUS, Color("1e1e1e"))
	draw_circle(player_position + Vector2(3.0, -4.0), 4.0, Color("fff7d6"))

func _draw_notebook() -> void:
	for row: int in range(12):
		var y_pos: float = 88.0 + row * 52.0
		draw_line(Vector2(80.0, y_pos), Vector2(1200.0, y_pos), Color("b7d5ff"), 2.0, true)
	draw_line(Vector2(120.0, 70.0), Vector2(120.0, 650.0), Color("ff8d8d"), 3.0, true)
	draw_rect(PLAYFIELD, Color("11111111"), false, 2.0)

func _draw_mailbox() -> void:
	var mailbox_rect: Rect2 = Rect2(mailbox_position - MAILBOX_SIZE * 0.5, MAILBOX_SIZE)
	var fill_color: Color = Color("7ea8ff") if mailbox_open else Color("aab4bf")
	draw_rect(mailbox_rect, fill_color, true)
	draw_rect(mailbox_rect, Color("202020"), false, 3.0)
	draw_line(mailbox_rect.position + Vector2(10.0, 30.0), mailbox_rect.position + Vector2(MAILBOX_SIZE.x - 10.0, 30.0), Color("202020"), 3.0, true)

func _draw_stamps() -> void:
	for stamp_index: int in range(stamp_positions.size()):
		if stamp_collected[stamp_index]:
			continue
		var stamp_pos: Vector2 = stamp_positions[stamp_index]
		var stamp_rect: Rect2 = Rect2(stamp_pos - Vector2(16.0, 16.0), Vector2(32.0, 32.0))
		draw_rect(stamp_rect, Color("fff2a5"), true)
		draw_rect(stamp_rect, Color("202020"), false, 2.0)
		draw_circle(stamp_pos, 6.0, Color("ff8d8d"))

func _draw_trails() -> void:
	if trail_points.size() < 2:
		return
	for trail_index: int in range(1, trail_points.size()):
		var previous_point: TrailPoint = trail_points[trail_index - 1]
		var current_point: TrailPoint = trail_points[trail_index]
		var alpha: float = 1.0 - clampf(current_point.age / TRAIL_LIFETIME, 0.0, 1.0)
		draw_line(previous_point.position, current_point.position, Color(0.11, 0.11, 0.11, alpha), 8.0, true)

func _draw_erasers() -> void:
	for eraser: EraserData in erasers:
		var eraser_rect: Rect2 = Rect2(eraser.position - Vector2(24.0, 16.0), Vector2(48.0, 32.0))
		draw_rect(eraser_rect, eraser.tint, true)
		draw_rect(eraser_rect, Color("202020"), false, 2.0)
		draw_line(eraser_rect.position + Vector2(8.0, 8.0), eraser_rect.position + Vector2(40.0, 24.0), Color("ffffff"), 2.0, true)

func _configure_input() -> void:
	_ensure_action(&"move_left", [KEY_A, KEY_LEFT])
	_ensure_action(&"move_right", [KEY_D, KEY_RIGHT])
	_ensure_action(&"move_up", [KEY_W, KEY_UP])
	_ensure_action(&"move_down", [KEY_S, KEY_DOWN])
	_ensure_action(&"draw_ink", [KEY_SPACE])
	_ensure_action(&"restart_run", [KEY_R])

func _ensure_action(action_name: StringName, keys: Array[int]) -> void:
	if not InputMap.has_action(action_name):
		InputMap.add_action(action_name)
	for keycode: int in keys:
		var event: InputEventKey = InputEventKey.new()
		event.keycode = keycode
		if not InputMap.action_has_event(action_name, event):
			InputMap.action_add_event(action_name, event)

func _create_ui() -> void:
	hud_label = Label.new()
	hud_label.position = Vector2(150.0, 24.0)
	hud_label.size = Vector2(980.0, 64.0)
	hud_label.add_theme_color_override("font_color", Color("202020"))
	add_child(hud_label)

	result_label = Label.new()
	result_label.position = Vector2(380.0, 320.0)
	result_label.size = Vector2(560.0, 80.0)
	result_label.add_theme_color_override("font_color", Color("202020"))
	result_label.visible = false
	add_child(result_label)

func _reset_run() -> void:
	player_position = START_POSITION
	trail_points.clear()
	erasers.clear()
	stamp_collected = [false, false, false]
	mailbox_open = false
	ink_budget = ink_budget_max
	auto_targets = stamp_positions.duplicate()
	auto_targets.append(mailbox_position)
	auto_index = 0
	elapsed_time = 0.0
	boost_time = 0.0
	drawing_time = 0.0
	eraser_contacts = 0
	run_complete = false
	run_failed = false
	exit_timer = 0.0
	result_label.visible = false
	_spawn_erasers()
	_refresh_hud()

func _spawn_erasers() -> void:
	var speed_a: float = 90.0 if auto_mode else 118.0
	var speed_b: float = 105.0 if auto_mode else 132.0
	erasers.append(EraserData.new(Vector2(940.0, 520.0), speed_a, Color("ffb2b2")))
	erasers.append(EraserData.new(Vector2(540.0, 180.0), speed_b, Color("ffd1b2")))

func _get_move_direction() -> Vector2:
	if auto_mode:
		return _get_auto_direction()
	return Input.get_vector(&"move_left", &"move_right", &"move_up", &"move_down")

func _get_auto_direction() -> Vector2:
	while auto_index < auto_targets.size():
		var target: Vector2 = auto_targets[auto_index]
		if auto_index < stamp_positions.size() and stamp_collected[auto_index]:
			auto_index += 1
			continue
		if auto_index == stamp_positions.size() and not mailbox_open:
			break
		var direction: Vector2 = target - player_position
		if direction.length() <= 14.0:
			auto_index += 1
			continue
		return direction.normalized()
	if mailbox_open:
		return (mailbox_position - player_position).normalized()
	return Vector2.ZERO

func _is_drawing() -> bool:
	if auto_mode:
		return ink_budget > 0.15 and _get_move_direction().length() > 0.0
	return Input.is_action_pressed(&"draw_ink")

func _append_trail_point(point_position: Vector2) -> void:
	if trail_points.is_empty():
		trail_points.append(TrailPoint.new(point_position))
		return
	var last_point: TrailPoint = trail_points[trail_points.size() - 1]
	if last_point.position.distance_to(point_position) >= TRAIL_POINT_DISTANCE:
		trail_points.append(TrailPoint.new(point_position))

func _update_trail(delta: float) -> void:
	var surviving_points: Array[TrailPoint] = []
	for point: TrailPoint in trail_points:
		point.age += delta
		if point.age <= TRAIL_LIFETIME:
			surviving_points.append(point)
	trail_points = surviving_points

func _is_on_fresh_ink(position_to_check: Vector2) -> bool:
	for point: TrailPoint in trail_points:
		if point.age <= 1.25 and point.position.distance_to(position_to_check) <= BOOST_RADIUS:
			return true
	return false

func _update_erasers(delta: float) -> void:
	for eraser: EraserData in erasers:
		var target_position: Vector2 = _get_eraser_target()
		var direction: Vector2 = (target_position - eraser.position).normalized()
		eraser.position += direction * eraser.speed * delta
		if eraser.position.distance_to(player_position) <= 28.0:
			eraser_contacts += 1
			player_position = START_POSITION
			trail_points.clear()
			ink_budget = ink_budget_max

func _get_eraser_target() -> Vector2:
	for point_index: int in range(trail_points.size() - 1, -1, -1):
		var point: TrailPoint = trail_points[point_index]
		if point.age <= TRAIL_ATTRACTION_WINDOW:
			return point.position
	return player_position

func _collect_stamps() -> void:
	for stamp_index: int in range(stamp_positions.size()):
		if stamp_collected[stamp_index]:
			continue
		if player_position.distance_to(stamp_positions[stamp_index]) <= PLAYER_RADIUS + STAMP_RADIUS:
			stamp_collected[stamp_index] = true

func _update_mailbox() -> void:
	mailbox_open = _collected_stamp_count() == stamp_collected.size()
	var mailbox_rect: Rect2 = Rect2(mailbox_position - MAILBOX_SIZE * 0.5, MAILBOX_SIZE)
	if mailbox_open and mailbox_rect.has_point(player_position):
		run_complete = true
		result_label.text = "Delivery complete in %.1fs" % elapsed_time
		result_label.visible = true
		_print_summary("PROCEED")

func _collected_stamp_count() -> int:
	var count: int = 0
	for collected: bool in stamp_collected:
		if collected:
			count += 1
	return count

func _refresh_hud() -> void:
	hud_label.text = "MAIL: %d/%d    INK: %.1f/%.1f    BOOST: %.1fs    CONTACTS: %d    %s" % [
		_collected_stamp_count(),
		stamp_collected.size(),
		ink_budget,
		ink_budget_max,
		boost_time,
		eraser_contacts,
		"HEADLESS DEMO" if auto_mode else "WASD/ARROWS MOVE  SPACE DRAW  R RESTART",
	]

func _print_summary(recommendation: String) -> void:
	var lines: PackedStringArray = PackedStringArray([
		"recommendation=%s" % recommendation,
		"elapsed_time=%.2f" % elapsed_time,
		"drawing_time=%.2f" % drawing_time,
		"boost_time=%.2f" % boost_time,
		"eraser_contacts=%d" % eraser_contacts,
		"stamps_collected=%d" % _collected_stamp_count(),
	])
	for line: String in lines:
		print(line)
	var file: FileAccess = FileAccess.open("res://run_metrics.txt", FileAccess.WRITE)
	if file != null:
		for line: String in lines:
			file.store_line(line)
