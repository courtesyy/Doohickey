extends Control

onready var data = get_node("Data");

var frameToDisplay = 0;


# helper function since I don't see an implementation of this?
# loop around ex. min is 0, max is 6, 7 loops back to 0
# shitty implementation since modulo doesn't work with floats but good enough for gamejam
func loop(value, maxValue, minValue = 0):

	while(!(value >= minValue && value < maxValue)):
		if(value >= maxValue):
			value = value - maxValue;
		elif(value < minValue):
			value = value + maxValue;

	return value;

### buttons and sliders

# yellow analog slider
onready var analogSliderL = get_node("Buttons/Large sliders/SliderL");
var xScaleMax = 1.66;
var xScaleMin = -1.66;
var offsetXSlider = 42; #TODO implement 
func _getScaleX():
	var percent = analogSliderL.value / 100.0;
	var xscale = ((xScaleMax - xScaleMin) * percent) + xScaleMin;
	return xscale;

# pink analog slider
onready var analogSliderR = get_node("Buttons/Large sliders/SliderR");
var yScaleMax = 1.08;
var yScaleMin = -1.08;
var offsetYSlider = 9;
func _getScaleY():
	var percent = analogSliderR.value / 100.0;
	var xscale = ((yScaleMax - yScaleMin) * percent) + yScaleMin;
	return xscale;

# blue analog dial
onready var analogDial1 = get_node("Buttons/Knobs/Knob1");
func _getPosX():
	return analogDial1.value;

# green analog dial
onready var analogDial2 = get_node("Buttons/Knobs/Knob2");
func _getPosY():
	return analogDial2.value;

# 64 binary 

# o binary 

# stepped grey slider

# pink on/off button
# disables/enables the screen 
var power = true;
func _on_Powerbutton_toggled(button_pressed):
	power = !button_pressed;
	if button_pressed == true:
		$Monitor/Line2D.visible = 0
	if button_pressed == false:
		$Monitor/Line2D.visible = 1

# blue analog slider
onready var analogSliderBlue = get_node("Buttons/Small sliders/Smallslider1");
func getPointsToDraw():
	var percent = analogSliderBlue.value / 100.0;
	var points = data.frameSize * percent;
	return floor(points);

# yellow stepped slider
onready var analogSliderYellow = get_node("Buttons/Small sliders/Smallslider2");
func getCountOffset():
	######TODO: give this an offset so the right answer isnt turning it down 
	var percent = analogSliderYellow.value / 100.0;
	var points = data.frameSize * percent;
	return floor(points);

# white button 
func _on_ColorbuttonWhite_pressed():
	frameToDisplay = 0;
	$Monitor/Line2D.default_color = Color.from_hsv(0.0, 0.0, 0.92)

# blue button 
func _on_ColorbuttonBlue_pressed():
	frameToDisplay = 1;
	$Monitor/Line2D.default_color = Color.from_hsv(0.55, 0.85, 1.0)

# green button 
func _on_ColorbuttonGreen_pressed():
	frameToDisplay = 2;
	$Monitor/Line2D.default_color = Color.from_hsv(0.33, 0.85, 1.0)

# yellow button 
func _on_ColorbuttonYellow_pressed():
	frameToDisplay = 3;
	$Monitor/Line2D.default_color = Color.from_hsv(0.16, 0.85, 1.0)

# red button 
func _on_ColorbuttonRed_pressed():
	frameToDisplay = 4;
	$Monitor/Line2D.default_color = Color.from_hsv(0.01, 0.85, 1.0)

var startingPoint = 0;

var allset = false;

func _ready():
	data.loadData();
	allset = true;


func _process(delta):
	if(!allset): return;

	_calculateTime();

	_transformData();
	_displayLine();

# determine what subset of the data is used for the line
# how many points and where to start/end
# time continues even if screen is turned off
func _calculateTime():
	pass

# apply fake oscilloscope
func _transformData():
	pass

onready var line = get_node("Monitor/Line2D");
# display the line 
func _displayLine():

	if(!power): return;
	
	#line.clear_points();

	#for i in range(framesPool[frameToDisplay].size()):
	for i in range(getPointsToDraw()):
		##### TODO: MAKE THIS LOOP back around
		#line.set_point_position((i - getCountOffset()), framesPool[frameToDisplay][i]);

		var indexPinged = loop(i - getCountOffset(), data.framesPool[frameToDisplay].size());

		var pointx = data.framesPool[frameToDisplay][indexPinged].x * _getScaleX();
		var pointy = data.framesPool[frameToDisplay][indexPinged].y * _getScaleY();
		var vector = Vector2(pointx, pointy);

		line.set_point_position(indexPinged, vector);



