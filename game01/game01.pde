import processing.sound.*;
Amplitude amp;
AudioIn in;

sprite s;
boulders b;
ground g;
zman z;
float grav = 1.5; //power of gravity


void setup()
{
  size(1000,800);
  frameRate(25);
  z = new zman(grav);
  g = new ground();
  b = new boulders();
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}

void draw()
{
  
  float level = amp.analyze();
  if(level > 0.05)
  {
    z.jumpSpeed = level*500.0;
    z.jump();
  }
  
  background(color(255,0,100));
  g.step();
  g.show();
  b.step();
  b.show();
  z.step();
  z.show();
}

void keyPressed() {
  if(keyCode == 32)
  {
    z.jump();
  }
}
