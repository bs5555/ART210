/*Example to use outer library*/
import peasy.*;  //After installing, you can import the lib 
PeasyCam cam;    //cam is a variable for PeasyCam class

void setup() 
{
  size(800,800,P3D); //P3D after size means e have a 3D window (OpenGL) with hardware acceleration
  cam = new PeasyCam(this, 100);  //create cam object
  cam.setMinimumDistance(50);  
  cam.setMaximumDistance(500);
}



void draw()
{
  noStroke();                             //set the viewing options
  shininess(10.0);                        //shininess of the objects we draw
  lightSpecular(200,200,200);             //specular light color
  directionalLight(153,153,153,-1,0,0);   //directional light
  pointLight(50,50,50,65,60,100);         //a spotlight
  ambientLight(102,102,102);              //ambient light  
  background(0);
  pushMatrix();
    drawScene();
  popMatrix();  
}

void drawScene()
{
  int d = 1;
  translate(-125*d,-125*d,-125*d);
  for(int red=0; red<255; red=red+10)
  {
    for(int blue=0; blue<255; blue=blue+10)
    {
      for(int green=0; green<255; green=green+10)
      {
        fill(red,blue,green);     //set color of the cube
        pushMatrix();
          translate(red*d,blue*d,green*d);
          box(5); //drawing a cube
        popMatrix();
      }
    }
  }  
}
