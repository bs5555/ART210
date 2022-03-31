import processing.sound.*;
Amplitude amp;   //audio analyzer 
AudioIn in;      //audio input

boulders b;      //boulders object
ground g;        //ground object
zman z;          //character object
coll c;          //collision detection object

startscreen s;   //start screen object
gameover o;      //game over screen

int gamestate = 0;
float grav = 1.5; //power of gravity
float ground_level = 100.0;  //ground level
int w = 0;
int h = 0;

PFont font;
PFont fonts;

void setup()
{
  size(1000,800);
  w = 1000;
  h = 800;
  surface.setTitle("Zman v0.1");
  surface.setResizable(true);
  surface.setIcon(loadImage("skull1.png"));
  frameRate(25);
  font = createFont("xx.ttf",100);
  fonts = createFont("xx.ttf",24);
  s=new startscreen();
  o=new gameover();
  
  ground_level = height*0.8;
  init();
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  registerMethod("pre", this);
}

void draw()
{
  
  if(gamestate==0)
  {
    s.show();
  }
  if(gamestate==1)
  {
    float level = amp.analyze();
    if(level > 0.05)
    {
      z.jumpSpeed = level*500.0;
      z.jump();
    }
    background(color(255,0,100));
    g.step();
    b.step();
    z.step();
  
    boolean coll = c.detect(0);
    if(coll)
    {
      z.die();
      g.stop();
      b.stop();
    }
  
    g.show(); 
    b.show();
    z.show();
    //z.s.showBox();
  }  
  if(gamestate==2)
  {
     o.show(); 
  }
}

void pre() 
{
  if (w != width || h != height) 
  {  println("resized");
    // Sketch window has resized
    w = width;
    h = height;
    ground_level = height*0.8;
    g.ground_level=ground_level;
    b.ground_level=ground_level;  
  }
}  

void keyPressed() 
{
  if(gamestate == 2)
  {
    init();
  }
  gamestate=1;
  if(keyCode == 32)
  {
    z.jump();
  }
}

void init()
{
  c = new coll();
  z = new zman(grav);
  c.addCharacter(z.s);
  g = new ground(ground_level,"ground.png");
  b = new boulders(ground_level);
}
