extends Node2D

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var label = $Label
	label.text = "Wealth: " + str(score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var label = $Label
	label.text = "Wealth: " + str(score)


func _on_bill_score_increase_100(amount: Variant) -> void:
	score+=100 # Replace with function body.


func _on_bill_score_increase_25(amount: Variant) -> void:
	score+=25 # Replace with function body.
