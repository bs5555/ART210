sprite s;
boulders b;
ground g;
int state = 0;  //0 = running, 1 = jumping, 2 = falling

void setup()
{
  size(1000,800);
  frameRate(25);
  s = new sprite();
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
  
  if(state == 1) //jumping up
  {
    s.speed = s.speed /1.1;
    if(s.speed < 0.5) 
    {
      state =  2;
      s.speed = 0.5;
      s.dir = 0;
    }
    println(s.speed);
  }
  
  if(state == 2) //falling down
  {
    s.speed = s.speed * 1.1;
    if(s.cy >= height/2)
    {
      s.speed = 0;
      state = 0;
      s.cy = height/2;
    }
  }
}

void keyPressed() {
  if(keyCode == 32)
  {
    jump();
  }
}

void jump()
{
  state = 1;
  s.speed = 25;
  s.dir = 180.0;
}
