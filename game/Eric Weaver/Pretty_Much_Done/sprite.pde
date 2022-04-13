//basic game object
class sprite
{
  float cx = width/2;            //position of sprite
  float cy = height/2;           //position of sprite
  PImage[] im = new PImage[50];  //frames of sprite
  int nImg = 0;                  //number of frames
  int cImg = 0;                  //current frame
  float dir = 0;                 //direction angle
  float speed = 0;               //previous speed
  float nextdir = 0;             //prevoius direction
  float nextspeed = 0;           //next speed
  float collision = 50;          //next direction
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
  }
  
  void showBox()
  {
    noStroke();
    fill(color(255,255,255,100));
    circle(this.cx,this.cy,this.collision*2.0);
  }
  
  void show()
  {
    if(nImg == 0)
    {
      circle(this.cx,this.cy,this.collision*2.0);
    }
    else
    {
      if(frameCount % 3 == 0)
      {
        cImg = cImg + 1;
        if(cImg >= nImg) cImg = 0;    
      } 
      pushMatrix();
      translate(this.im[0].width/-2.0,this.im[0].height/-2.0);
      image(im[cImg],this.cx,this.cy);
      popMatrix();
    }
  }
  
  void loadFrame(String fname)
  {
     this.im[nImg]=loadImage(fname);
     nImg = nImg + 1;
  }
  
}
