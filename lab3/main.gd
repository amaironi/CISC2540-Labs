extends Node2D

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var label = $Label
	var winlabel = $Win
	label.text = "Wealth (need at least 400 to win): " + str(score) + "/500"
	if score >= 400:
		get_tree().paused = true
		winlabel.text = "YOU WIN! ENJOY THE HIGH ROLLER-LIFE!"

		

func _on_bill_score_increase_100(amount: Variant) -> void:
	score+=100 # Replace with function body.


func _on_bill_score_increase_25(amount: Variant) -> void:
	score+=25 # Replace with function body.


func _on_timer_timeout() -> void:
	get_tree().paused = true
	var winlabel = $Win
	winlabel.text = "YOU LOSE. TIME TO GO BACK TO WORK..."
