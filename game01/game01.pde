sprite s;
boulders b;
ground g;
int state = 0;  //0 = running, 1 = jumping, 

void setup()
{
  size(1000,800);
  frameRate(25);
  s = new sprite();
  s.dir = 30.0;
  s.cx=200;
  s.loadFrame("character1.png");
  s.loadFrame("character2.png");
  g = new ground();
  b = new boulders();
}

void draw()
{
  background(color(255,0,100));
  g.step();
  g.show();
  b.step();
  b.show();
  s.step();
  s.show();
}

void keyPressed() {
  if(keyCode == 32)
  {
    state = 1;
  }
}








//basic game object
class sprite
{
  float cx = width/2;            //position of sprite
  float cy = height/2;           //position of sprite
  PImage[] im = new PImage[10];  //frames of sprite
  int nImg = 0;                  //number of frames
  int cImg = 0;                  //current frame
  float dir = 0;                 //direction angle
  float speed = 0;               //previous speed
  float nextdir = 0;             //prevoius direction
  float nextspeed = 0;           //next speed
  float collision = 100;         //next direction
  float acceleration = 0.0;      //acceleration 
  float gravity = 0.0;           //gravity
  
  sprite()
  {
    
  }
  
  void step()
  {
    this.speed = this.speed + this.acceleration - this.gravity;
    this.cx=this.cx+(sin(radians(this.dir))*speed);
    this.cy=this.cy+(cos(radians(this.dir))*speed);
    /*if(cx < 0) cx = width;
    if(cx > width) cx = 0;
    if(cy < 0) cy = height;
    if(cy > height) cy = 0;*/
  }
  
  void show()
  {
    if(nImg == 0)
    {
      circle(this.cx,this.cy,this.collision);
    }
    else
    {
      if(frameCount % 3 == 0)
      {
        cImg = cImg + 1;
        if(cImg >= nImg) cImg = 0;    
      } 
      image(im[cImg],this.cx,this.cy);
    }
  }
  
  void loadFrame(String fname)
  {
     this.im[nImg]=loadImage(fname);
     nImg = nImg + 1;
  }
  
}
