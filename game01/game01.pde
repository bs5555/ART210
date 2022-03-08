sprite s;
sprite gr;
sprite gr1;
ArrayList<sprite> boulders = new ArrayList<sprite>();

void setup()
{
  size(1000,800);
  frameRate(25);
  s = new sprite();
  s.dir = 30.0;
  s.cx=200;
  s.loadFrame("character1.png");
  s.loadFrame("character2.png");
  ground_setup();
  setup_boulders();
}

void draw()
{
  background(color(255,0,100));
  gr.step();
  gr.show();
  gr1.step();
  gr1.show();
  ground_step();
  step_boulders();
  show_boulders();
  s.step();
  s.show();
}

void setup_boulders()
{
  for(int i=0; i<5; i=i+1)
  {
    sprite temp = new sprite();
    temp.cx=width+random(width);
    temp.cy=580+random(20);
    temp.dir=270;
    temp.speed=15;
    boulders.add(temp);
  }
}

void show_boulders()
{
  for(int i=0; i<boulders.size(); i=i+1)
  {
    sprite temp = boulders.get(i);
    temp.step();
    temp.show();
  }
}

void step_boulders()
{
  for(int i=0; i<boulders.size(); i=i+1)
  {
    sprite temp = boulders.get(i);
    if(temp.cx <= 0) 
    {
      boulders.remove(i);
      temp.cx=width+random(width*3);
      temp.cy=580+random(20);
      temp.dir=270;
      temp.speed=15;
      boulders.add(temp);
    }
  }
}

void ground_setup()
{
  gr = new sprite();
  gr.cx = 0;
  gr.cy = 550;
  gr.dir=270;
  gr.speed=15;
  gr.loadFrame("ground.png");
  
  gr1 = new sprite();
  gr1.cx = gr.im[0].width;
  gr1.cy = 550;
  gr1.dir=270;
  gr1.speed=15;
  gr1.loadFrame("ground.png");
}

void ground_step()
{
  if(gr1.cx <= 0)
  {
    println("change");
    gr.cx = gr1.cx+gr.im[0].width;
  }
  if(gr.cx <= 0)
  {
    println("change");
    gr1.cx = gr.cx+gr.im[0].width;
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
  
  sprite()
  {
    
  }
  
  void step()
  {
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
