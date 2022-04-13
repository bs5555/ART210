PImage bg;
startscreen sc;
gameover go;
displayScore ds;

PFont font;
PFont fonts;

int jumpCount = 0;   
int objectSpeed = 15;
int score = millis();
int scoreCount = 0;

int gameState = 0;
sprite s;
boulders b;
ground g;
zman z;
coll c;
float grav = 1.5; //power of gravity`


void setup()
{
  size(1000,800);
  frameRate(25);
  init();
  
  sc = new startscreen();
  go = new gameover();
  ds = new displayScore();

  
  font = createFont("main.ttf",50);
  fonts = createFont("main.ttf",150);
  
  surface.setIcon(loadImage("boulder1.png"));
}

void draw()
{
  if(gameState==0)//Start screen
  {
    sc.show();
  }
  
  if(gameState==1)//the game
  {
  
  background(bg);
  g.step();
  b.step();
  z.step();
  
  if(score%15000==0)
  {
    scoreCount++;
  }
  
  if(scoreCount%200==0)
  {
   objectSpeed=objectSpeed+3;
  }
    
  boolean coll = c.detect(0);
  if(coll)
  {
    z.die();
    g.stop();
    b.stop();
  }
  
  ds.show();
  g.show(); 
  b.show();
  z.show();
  }
  
  if(gameState==2)
  {
    go.show();
    init();
  }
  
}

void keyPressed() {
  if(keyCode == 32)
  {
    gameState=1;
    z.jump();
  }
}

void init()
{
  c = new coll();
  z = new zman(grav);
  c.addCharacter(z.s);
  g = new ground();
  b = new boulders();
  bg = loadImage("background.png");
}
