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
var xScaleMax = 3.0;
var xScaleMin = -3.0;
var offsetXSlider = 42; #TODO implement 
func getScaleX():
	var percent = analogSliderL.value / 100.0;
	var xscale = ((xScaleMax - xScaleMin) * percent) + xScaleMin;
	return xscale;

# pink analog slider
onready var analogSliderR = get_node("Buttons/Large sliders/SliderR");
var yScaleMax = 2.5;
var yScaleMin = -2.5;
var offsetYSlider = 9;
func getScaleY():
	var percent = analogSliderR.value / 100.0;
	var xscale = ((yScaleMax - yScaleMin) * percent) + yScaleMin;
	return xscale;

# blue analog dial
onready var analogDial1 = get_node("Buttons/Knobs/Knob1");
func getRotateOne():
	return analogDial1.value;
# current point the count starts from. a slider might control this but the real answer is 0
# maybe use that other thing's behavior 
func getStartingPoint():
	return 0;
# how many points the current point will increase per unit of time and how many points are drawn. a slider controls this, the real answer is the size of each frame
func getFrameStarting():
	return 0;
func getFramesFromStarting():
	return 0;

# green analog dial
onready var analogDial2 = get_node("Buttons/Knobs/Knob2");
func getRotateTwo():
	return analogDial2.value;

# how many multiples of the points per frame out from starting
var modifiedFrameIndex = 0;

# 64 binary 
# ???????

# o binary
# can pause the animation/moving between frames. 
onready var binaryCircle = get_node("Buttons/Small buttons/SingleButton"); 
func isAnimating():
	return !(binaryCircle.pressed);

# stepped grey slider
# time scale 
# unit of time. changing this is changed by the dial and controls the speed of the animation. deltatime passing this moves to the next 
# these are for the slider (yellow)
var timeUnitMin = 0.02;
var timeUnitMax = 0.8;
onready var steppedSlider = get_node("Buttons/Small sliders/SmallsliderR");
func getTimeScale():
	var percent = steppedSlider.value / 100.0;
	var sscale = ((timeUnitMax - timeUnitMin) * percent) + timeUnitMin;
	return sscale;

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
	#frameToDisplay = 0;
	$Monitor/Line2D.default_color = Color.from_hsv(0.0, 0.0, 0.92)

# blue button 
func _on_ColorbuttonBlue_pressed():
	#frameToDisplay = 1;
	$Monitor/Line2D.default_color = Color.from_hsv(0.55, 0.85, 1.0)

# green button 
func _on_ColorbuttonGreen_pressed():
	#frameToDisplay = 2;
	$Monitor/Line2D.default_color = Color.from_hsv(0.33, 0.85, 1.0)

# yellow button 
func _on_ColorbuttonYellow_pressed():
	#frameToDisplay = 3;
	$Monitor/Line2D.default_color = Color.from_hsv(0.16, 0.85, 1.0)

# red button 
func _on_ColorbuttonRed_pressed():
	#frameToDisplay = 4;
	$Monitor/Line2D.default_color = Color.from_hsv(0.01, 0.85, 1.0)

var startingPoint = 0;

var allset = false;

func _ready():
	data.loadData();
	allset = true;


func _process(delta):
	if(!allset): return;

	_calculateTime(delta);

	_transformData();
	_displayLine();


# time counter. paused when animating but not when the screen is off. used with unit of time.
var timeCounter = 0.0;

func _calculateTime(deltaTime):

	# add to point time only if animating
	if(!isAnimating()): return;

	timeCounter = timeCounter + deltaTime;

	var timeUnit = getTimeScale();

	# tick frame if a unit of time passes
	if(timeCounter > timeUnit):
		timeCounter = 0.0;
		modifiedFrameIndex = modifiedFrameIndex + 1;
		#temp using regular frames to test time 
		frameToDisplay = loop(frameToDisplay + 1, data.numAnimationFrames);


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

		var frameIndex = data.getFrameIndex(frameToDisplay);

		var indexPinged = loop(i - getCountOffset(), data.framesPool[frameIndex].size());

		var pointx = data.framesPool[frameIndex][indexPinged].x * getScaleX();
		var pointy = data.framesPool[frameIndex][indexPinged].y * getScaleY();
		var vector = Vector2(pointx, pointy);

		line.set_point_position(indexPinged, vector);

		# rotate 
		var rotation = (getRotateOne() / 100) * 360;
		line.rotation_degrees = rotation;

		# width
		var width = (getRotateTwo() / 100) * 0.01;
		line.width = width;

