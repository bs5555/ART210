//doube slashes means comment, it is just for humans, not the computer
/*
This ia also a comment. This is our first example. 
*/
//this is setup function, executed once, when the program starts 
void setup()
{
  size(800,600); //we want a 800x600 pixels window
}

void draw()
{
  noStroke();                        //set stroke to none
  fill(color(255,255,255,10));       //set fill color to semi-transparent white
  rect(0,0,width,height);            //draw a semi-transparent rectangle with no border
  stroke(1);                         //set stroke to 1 pixel
  line(mouseX,mouseY,random(0,width),random(0,height));  //draw a line from the mouse position to to a random point
}
