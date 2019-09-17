/*
Exercise 03
Model of orbiting system, such as the solar system
How to create and use objects?
*/

float x = 0;                                        // we need a box, to store a number for animation counter
int n_orbit=10;                                    //number of orbits, execept the sun
ArrayList<orbit> orbits = new ArrayList<orbit>();   //arraylist to store orbit objects 

void setup()
{
  size(800,600);
  background(color(255,255,255));
  surface.setResizable(true);
  createSystem();
}

void draw(){
 
  //clear the screen, but leave trails
  fill(color(255,255,255,1));
  rect(0,0,width,height);
  
  translate(width/2,height/2); //move everything into center
  
  for (int i = 0; i < orbits.size(); i++) 
  {
    orbit o = orbits.get(i);
    o.draw(x);
  }  
  
  
  /*
  //This is a planet
  pushMatrix();
  orbit(x,100,0,color(30,90,180),40);
   //This is a moon
   pushMatrix();
   orbit(x*2.75,50,0,color(130,90,180),20);
   popMatrix();
  popMatrix();
  
  //Another planet (no moon)
  pushMatrix();
  orbit(x/2,200,0,color(255,80,50),30);
  popMatrix();
  
  //Yet another planet wit two moons
  pushMatrix();
  orbit(x/(-3),260,0,color(80,150,50),30);
   pushMatrix();
   orbit(x*2,30,0,color(80,150,150),15);
   popMatrix();
   pushMatrix();
   orbit(x*(-3),50,0,color(180,150,50),10);
   popMatrix(); 
  popMatrix();
  */
  x=x+1.0; //increase the animation counter
}

class orbit
{
  float transX = 0.0;
  float transY = 0.0;
  float radius = 10.0;
  color c = color(10,20,30);
  float speed = 1.0;
  int moon = 0;
  
  orbit(float d,float rad,color col, float sp, int isMoon)
  {
    transX=d;
    transY=d;
    c=col;
    radius = rad;
    speed = sp;
    moon = isMoon;
  }
  
  void draw(float x)
  {
    if(moon==0) pushMatrix();
    noStroke();                    //no strokes for nice trails  
    rotate(radians(x*speed));     //rotate
    translate(transX,transY);      //translate
    fill(c);                       //set orbit color
    ellipse(0,0,radius,radius);    //draw a circle
    if(moon==0) popMatrix();
  }
}

void createSystem()
{
  int n = 0;
  for(n=0; n<n_orbit; n++)
  {
    float transX = random(10,100);
    color c = color(random(0,255),random(100,255),random(0,50),10);
    float radius = random(10,30);
    float sp = (random(0,10)-random(0,10))/random(10,20);
    int isMoon = round(random(0,1));
    orbits.add(new orbit(transX,radius,c,sp,isMoon));
  }
}
