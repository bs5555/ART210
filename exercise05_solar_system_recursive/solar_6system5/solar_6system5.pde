float x = 0;
ArrayList<orbit> orbits = new ArrayList<orbit>();
orbit earth;
orbit mars;
orbit venus;

void setup()
{
  size(800,600);
  for(int i = 0; i<10; i++)
  {
    orbits.add(new orbit(true));
  }  
  
}

void draw()
{
  noStroke();
  fill(color(255,255,255,20));
  rect(0,0,width,height);
  translate(width/2,height/2);
  for(int i = 0; i< orbits.size(); i++)
  {
    orbits.get(i).drawMe(x);
  }
  x = x+1;
}


class orbit
{
  float radius = 0;
  float speed = 0;
  float distance = 0;
  color c;
  ArrayList<orbit> moons = new ArrayList<orbit>();
  
  orbit(boolean moon)
  {
    radius = random(10,25);
    speed = random(-1.5,1.5);
    distance = random(10,500);
    c = color(random(0,100),random(0,55),random(0,255));
    if(moon)
    {
      int nMoons = round(random(0,5));
      for(int i = 0; i < nMoons; i++)
      {
        moons.add(new orbit(false));
      }
    }  
  }
  
  void drawMe(float x)
  {
     pushMatrix();
       noStroke();                    //no strokes for nice trails  
       rotate(radians(x*speed));      //rotate
       translate(distance,0);         //translate
       fill(c);                       //set orbit color
       ellipse(0,0,radius,radius);    //draw a circle
       for(int i=0; i<moons.size(); i++)
       {
         moons.get(i).drawMe(x);
       }
     popMatrix();
  }
}
