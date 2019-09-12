/*
Exercise 2 
Draw a chess-table. It is from 8x8 rectangles
*/

void setup()
{
  size(800,800,P3D); //set up the window size to 800x800 pixels -- chess tables are square. We use 3D window ti have fun
}

void draw()
{
  
  //uncomment the next line to have fun
  //rotateX(radians(30));
  
  int x=0; //This is a box, named 'x' and we can put an integer number into it
  int y=0; //This is an other box, named 'y'
  /*
  The next block is two cascading loops. 'for' is the keyword used for loops. 
  After the keyword in the parenthesis three condition must have set:
   1. The value in the box (variable) at the first execution of the loop
   2. The condition when the loop ends. 
      In our case it will end, when the value is bigger than 8.
   3. Increasing or decreasing the value in each execution
   If you thin it over, yo can understand, if the second condition is never will be true, 
   your loop will keep executing forever. People used to call itt 'freezing'.
  */
  for(x=0; x<8; x++) //This is a loop. 
  {
    for(y=0; y<8; y++) //This is a second loop
    {
      fill(color(255,255,255)); // always start with white fill color
      if(x % 2 == 0 && y % 2 == 0) fill(color(0,0,0)); //if the x coordinate is even AND the y coordinate is even, we switch to black
      if(x % 2 != 0 && y % 2 != 0) fill(color(0,0,0)); //if the x coordinate is odd AND the y coordinate is odd, we switch to black
      rect((width/8)*x,(height/8)*y,width/8,height/8); //draw the rectange into the right place with the right color
    }
    
  }
}
