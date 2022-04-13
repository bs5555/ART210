import processing.sound.*;
Amplitude amp;
AudioIn in;

boulders b;
ground g;
background j;
zman z;
coll c;
coll2 n;
bat l;

startscreen s;
gameover o;

int gamestate = 0;
float grav = 1.5; //power of gravity
float ground_level = 100.0;  //ground level
int w = 0;
int h = 0;

PFont Text;
PFont fonts;
PFont fontEnd;
PFont Title;

void setup()
{
  size(1000,800);
  w = 1000;
  h = 800;
  surface.setTitle("Zman v0.1");
  surface.setResizable(true);
  surface.setIcon(loadImage("skull1.png"));
  frameRate(25);
  Text = createFont("Text.ttf",30);
  Title = createFont("Title.ttf",140);
  fonts = createFont("RubikEnd.ttf",100);
  fontEnd = createFont("Glitch.ttf",30);
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
  g.step();
  b.step();
  l.step();
  z.step();
  j.step();
  
  boolean coll = c.detect(0);
  if(coll)
  {
    z.die();
    g.stop();
    l.stop();
    j.stop();
    b.stop();
  }
  
  boolean coll2 = n.detect(0);
  if(coll2)
  {
    z.die();
    l.stop();
    j.stop();
    l.stop();
    b.stop();
  }
  
  g.show(); 
  j.show();
  b.show();
  l.show();
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
  n = new coll2();
  z = new zman(grav);
  c.addCharacter(z.s);
  n.addCharacter(z.s);
  g = new ground(ground_level,"ground.png");
  j = new background();
  b = new boulders(ground_level);
  l = new bat();
}
