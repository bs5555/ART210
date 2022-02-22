import controlP5.*;    //imports the control library
ControlP5 cp5;         // a variable for the control object

float huemin = 0;      //minimum value for hue
float huemax = 360;    //maximum value for hue

float satmin = 0;      //minimum value for saturation
float satmax = 100;    //maximum value for saturation

float valmin = 0;      //minimum value for lightness
float valmax = 100;    //maximum value for lightness

void setup()
{
  size(1200,1000);
  cp5 = new ControlP5(this);                                     //creating cp5 object instance
  cp5.addSlider("huemin").setPosition(1010,10).setRange(0,360);  //adding a slider for huemin 
  cp5.addSlider("huemax").setPosition(1010,30).setRange(0,360);  //adding a slider for huemax 
  
  cp5.addSlider("satmin").setPosition(1010,60).setRange(0,100);  //adding a slider for satmin 
  cp5.addSlider("satmax").setPosition(1010,80).setRange(0,100);  //adding a slider for satmax 
  
  cp5.addSlider("valmin").setPosition(1010,110).setRange(0,100);  //adding a slider for valmin 
  cp5.addSlider("valmax").setPosition(1010,130).setRange(0,100);  //adding a slider for valmax 
}

void draw()
{
        stroke(randomColor());
        strokeWeight(random(40));
  for(int y=0; y<1000; y=y+100)
  {
    for(int x=0; x<1000; x=x+100)
    {
      
      fill(randomColor());  //random color for each rectangle
      rect(x,y,100,100);    //draw the rectangle
    }
  } 
  //delay(1000);
}


color randomColor()
{
  colorMode(HSB,360,100,100);
  return(color(random(huemin,huemax),random(satmin,satmax),random(valmin,valmax)));
}
