extends Control

# yellow analog slider
onready var analogSliderL = get_node("Buttons/Large sliders/SliderL");
func _getScaleX():
	return analogSliderL.value * 0.1;

# pink analog slider
onready var analogSliderR = get_node("Buttons/Large sliders/SliderR");
func _getScaleY():
	return analogSliderR.value * 0.1;

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

# blue analog slider 

# yellow stepped slider 

# white button 
onready var binaryButtonWhite = get_node("Buttons/Color keys/ColorbuttonWhite");
# TODO make this happen when pressed 
func _colorPressedWhite():
	print("white pressed");
	pass;

# blue button 
onready var binaryButtonBlue = get_node("Buttons/Color keys/ColorbuttonBlue");

# green button 
#onready var binaryChime3 = get_node("Chime3");

# yellow button 

# red button 

# pink on/off button
# disables/enables the screen 
onready var binaryOnOff = get_node("Buttons/Small buttons/Powerbutton");
# used

var numFrames;

# from the files 
var framesRawX;
var framesRawY;

# only storing one of each frame, but the animation pingpongs 
var virtualFrameIndex = [0, 1, 2, 3, 4, 5, 6, 5, 4, 3, 2, 1];

#after the function
var pointsTransformedX;
var pointsTransformedY;

var allset = false;

func _ready():
	print("called _ready");
	_loadData();

func _loadData():
	print("called load data");
	allset = true;

func _process(delta):
	if(!allset): return;

	_calculateTime();

	# don't display if the screen is off
	if(binaryOnOff.pressed): return;

	_transformData();
	_displayLine();

# determine what subset of the data is used for the line
# how many points and where to start/end
# time continues even if screen is turned off
func _calculateTime():
	#print("calculating time");
	pass

# apply fake oscilloscope
func _transformData():
	#print("applying transform to raw data");
	pass

# display the line 
func _displayLine():
	#print("displaying transformed data to monitor");
	pass
