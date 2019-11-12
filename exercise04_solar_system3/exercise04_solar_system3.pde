/*
Exercise 03
Model of orbiting system, such as the solar system
How to create and use objects?
*/

float x = 0;                                        // we need a box, to store a number for animation counter
int n_orbit=8;                                    //number of orbits, execept the sun
ArrayList<orbit> orbits = new ArrayList<orbit>();   //arraylist to store orbit objects 
PGraphics orbitLayer;
PGraphics planetLayer; 
int w, h;

void setup()
{
  size(1600,1000,P3D);
  background(color(255,255,255));
  w = width;
  h = height;
  surface.setResizable(true);
  orbitLayer=createGraphics(width,height);
  planetLayer=createGraphics(width,height);
  createSystem();
  registerMethod("pre", this);
}

void draw(){
 
  //clear the screen, but leave trails
  //ill(color(255,255,255,50));
  //rect(0,0,width,height);
  planetLayer.beginDraw();
  orbitLayer.beginDraw();
  orbitLayer.noStroke();
  orbitLayer.fill(color(255,255,255,5));
  orbitLayer.rect(0,0,width, height);
  orbitLayer.stroke(1);
  orbitLayer.noFill();
  
  planetLayer.clear();
  planetLayer.translate(width/2,height/2);
  
  for (int i = 0; i < orbits.size(); i++) 
  {
    orbit o = orbits.get(i);
    o.draw(x);
  }
  orbitLayer.endDraw();
  planetLayer.endDraw();
  background(color(255,255,255));
  image(orbitLayer,0,0,width,height);
  image(planetLayer,0,0,width,height);
  x=x+1.0; //increase the animation counter
 // if(x==360.0) x=0.0;
}

void pre() 
{
  if (w != width || h != height) 
  {
    w = width;
    h = height;
    orbitLayer=createGraphics(width,height);
    planetLayer=createGraphics(width,height);
  }
}

class orbit
{
  float transX = 0.0;
  float transY = 0.0;
  float radius = 10.0;
  color c = color(10,20,30);
  float start_angle = 0;
  float speed = 1.0;
  ArrayList<orbit> moons = new ArrayList<orbit>();
  float oldx = 0;
  float oldy = 0;
  
  orbit(float d,float rad,color col, float sp, float start_a)
  {
    transX=d;
    transY=d;
    c=col;
    radius = rad;
    speed = sp;
    start_angle=start_a;
  }
  
  void addMoon(float d,float rad,color col, float sp, float start_a)
  {
    moons.add(new orbit(d,rad,col,sp,start_a));
  }
  
  void draw(float x)
  {
      planetLayer.pushMatrix();
        planetLayer.noStroke();
        planetLayer.rotate(radians(x*speed)+start_angle);     //rotate
        planetLayer.translate(transX,transY);      //translate
        planetLayer.fill(c);                       //set orbit color
        planetLayer.ellipse(0,0,radius,radius);    //draw a circle
        if(oldx!=0 && oldy!=0) orbitLayer.line(oldx,oldy,planetLayer.screenX(0,0),planetLayer.screenY(0,0));
        oldx=planetLayer.screenX(0,0);
        oldy=planetLayer.screenY(0,0);
        for(int j = 0; j <moons.size(); j++)
        {
          moons.get(j).draw(x);
        }
        
      planetLayer.popMatrix(); 
  }
}

void createSystem()
{
  int m = 0;
  int p = 0;
  int n = 0;
  for(n=0; n<n_orbit; n++)
  {
    float transX = random(10,250);
    color c = color(random(0,255),random(100,255),random(0,50),100);
    //color c = color(255,120,30);
    float radius = random(15,35);
    float sp = (random(0.01,1)-random(0.01,1));
    float start_a=random(0,360);
    orbit buf = new orbit(transX,radius,c,sp,start_a);
    
    int nmoons = round(random(0,4));
    for(int i=0; i<nmoons; i++)
    {
      transX = random(10,50);
      //c = color(random(0,255),random(100,255),random(0,50),100);
      //c = color(30,120,255);
      radius = random(5,15);
      sp = (random(0.01,1)-random(0.01,1));
      start_a=random(0,360);
      buf.addMoon(transX,radius,c,sp,start_a);
    }
    
    orbits.add(buf);
  }
  println(p);
  println(m);
}
