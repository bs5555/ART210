import processing.sound.*;
Amplitude amp;   //audio analyzer 
AudioIn in;      //audio input

boulders b;      //boulders object
ground g;        //ground object
ground sky;
ground mountains;
ground clouds;
zman z;          //character object
coll c;          //collision detection object

startscreen s;   //start screen object
gameover o;      //game over screen

int gamestate = 0;
float grav = 1.5; //power of gravity
float ground_level = 100.0;  //ground level
int w = 0;
int h = 0;
int startTime = 0;
int score = millis();
int score_old =0;
int end_score = 0;
float diff = 0;

PFont font;
PFont fonts;

void setup()
{
  size(1000,800,P3D);
  w = 1000;
  h = 800;
  surface.setTitle("RoboRun v0.1");
  surface.setResizable(true);
  surface.setIcon(loadImage("icon.png"));
  frameRate(25);
  font = createFont("xx.ttf",100);
  fonts = createFont("xx.ttf",24);
  s=new startscreen();
  o=new gameover();
  
  ground_level = height*0.7;
  
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
    diff += 0.03;
    
   
    float level = amp.analyze();
    if(level > 0.05)
    {
      z.jumpSpeed = level*500.0;
      z.jump();
    }
    background(color(255,0,100));
      
    mountains.step();
    mountains.setSpeed(diff);
    
    sky.step();
    sky.setSpeed(diff);

    clouds.step();
    clouds.setSpeed(diff);

    g.step();
    g.setSpeed(diff);
  

    b.step();
    b.setSpeed(diff);

    z.step();
  
    boolean coll = c.detect(0);
    if(coll)
    {
      z.die();
      mountains.stop();
      clouds.step();
      sky.stop();
      clouds.stop();
      g.stop();
      b.stop();
      score_old=score_old+score;
      
    }
  
    sky.show();
    mountains.show();
    clouds.show();
    g.show(); 
    b.show();
    z.show();
    //z.s.showBox();
    
    if(z.state!= -1)
    {textSize(64);
    fill(0);
    textAlign(LEFT);
    text(score,45,125);
    text(score,38,118);
    fill(255);
    text(score,40,120);
    end_score = score;
    }
    score = (millis()/100)-score_old;
    
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
  sky = new ground(4,0,"sky.png");
  mountains = new ground(6,0,"mountains.png");
  clouds = new ground(8,0,"Clouds.png");
  g = new ground(15,ground_level,"Dirt.png");
  b = new boulders(15,ground_level);
  diff = 2;
}
