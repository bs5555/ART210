int d = 0; //time
ArrayList<sprite> sprites= new ArrayList<sprite>();  //spritelist
land bg;     //landscape class
clouds cl;   //clouds class
cactus ca;   //cactus classes
rocks rs;    //rocks classes
int ncactus = 4;
int ncloud = 10;
int nrocks = 3;


int player;  //player index
int STATE = 0;  //game state

void setup()
{
  size(800,600);
  frameRate(24);
  //make background
  bg = new land();
  cl = new clouds(0,ncloud);
  ca = new cactus(ncloud,ncloud+ncactus);
  rs = new rocks(ncloud+ncactus,ncloud+ncactus+nrocks);
  
  //make the player
  anim buf = new anim(2);
  buf.addFrame("manwalk1.png");
  buf.addFrame("manwalk2.png");
  sprites.add(new sprite(width/2,height*0.8,1,new vec2(0,0),buf));
  player=sprites.size()-1;  
}


void draw()
{
  bg.showMe();
  cl.check();
  ca.check();
  rs.check();
  for(int i=0; i<sprites.size(); i++)
  {
    sprites.get(i).showMe();
  }
  d++;
  if(d>1000000) d=0;
}




class vec2
{
  float x;
  float y;
  vec2(float xx,float yy)
  {
    this.x=xx;
    this.y=yy;
  }
}

class anim
{
  PImage frames[] = new PImage[10];
  int count=0;
  int speed = 1;
  int p = 0;
  float dx;
  float dy;  
  
  anim(int sp)
  {
    this.speed=sp;
    this.count = 0;
  }
  
  void addFrame(String imgname)
  {
    this.frames[this.count]=loadImage(imgname);
    this.dx=this.frames[this.count].width/2.0;
    this.dy=this.frames[this.count].height/2.0;
    this.count++;
    
  }
  
  void showMe()
  {
    
    image(frames[p],-dx,-dy);
    if(d % speed == 0)
    {
      p++;
      if(p >= count) p=0;
    }  
  }
}

class sprite
{
  float x;
  float y;
  float speed; 
  vec2 dir;
  int state = 0;
  anim animation;
  
  
  sprite(float xx,float yy,float sp, vec2 d, anim a)
  {
      this.x=xx;
      this.y=yy;
      this.speed=sp;
      this.dir=d;
      this.state=0;
      this.animation=a;
  }
  
  void showMe()
  {
    pushMatrix();
      translate(this.x,this.y);
      this.animation.showMe();    
    popMatrix();
    if(STATE==1)
    {
      this.x=this.x+(dir.x*speed);
      this.y=this.y+(dir.y*speed);
    }
  }
  
  float getX()
  {
    return(this.x);
  }

}

void keyPressed()
{
  if(key==' ')
  {
    if(STATE==0)
    {
      STATE=1;
    }
    else
    {
      STATE=0;
    }
  }
}
