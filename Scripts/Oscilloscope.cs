

public class Oscilloscope {


    //data file resources- or get dynamically from path 
    const string dataPath = "res://Data/";

    //number of frame data files to load
    const int numFrames = 1;
    //frames in the animation 
    const int numFramesAnimation;

    //value keeping track of time
    //(that gets converted to where in 200ms it would be in frames, which gest converted into loop(7+6), which gets converted from 1 through 13 to 1-2-3-4-5-6-7-6-5-4-3-2)

    //points of data in each frame 
    int [] pointsInFrame;

    //fuck all life, jagged int array 
    //data[frame][pointInFrame]
    //data loaded from text files
    float [numFrames] [] dataX, dataY;

    //displayed onscreen after transformation
    float [numFrames] [] dataXDisplayed, dataYDisplayed;

    //const: how many points of data to read at a time / points on the displayed line 

    //fields: tuning values changed by the interface 

    //consts: the 'correct' values
    //consts: the thresholds for the 'correct' values 

    //references to: 
    //the knobs
    //the line to output to 

    /*********/
    //parameters 

    //points of data to display per 

    /*********/


    //TODO: wait no we should save all the data in one contiguous array, normalize the number of points per frame, and save the decoding values as the correct ones but scramble them
    
    //called once at start of game
    public void Begin() {
        
        LoadData();

        //TODO scramble the initial values 
    }


    //load point data into vars from text files 
    public void LoadData() {

        for(int i = 0; i < numFrames; i++) {
            string xName = "frame" + i + "x";
            string yName = "frame" + i + "y";
            //read in lines as floats to each arr from each file 
        }

    }

    //function: tick 
    public void Tick() {

    }

    //helper function: transform virtual location to actual location since
    //the order of the frames is 1-2-3-4-5-6-7-6-5-4-3-2 with 200ms in between each

    //function: update params according to input settings (or this gets done by those nodes?)

    //function: determine what portion of the data we need to read based on tuning values 

    //function: transform the portion of the data we need based on tuning values 

    //function: based on transformed data and what section of it, display the line

    //function: check if params are within correct values, and if so, give feedback to the player 
    
}

