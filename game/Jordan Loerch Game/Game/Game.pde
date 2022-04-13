 import processing.sound.*;
Amplitude amp;
AudioIn in;

sprite s;
boulders b;
ground g;
zman z;
coll c;
float grav = 1.5; //power of gravity


void setup()
{
  size(1000,800);
  frameRate(25);
  
  c = new coll();
  z = new zman(grav);
  c.addCharacter(z.s);
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
  background(color(173,216,230));
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
 // z.s.showBox();
}

void keyPressed() {
  if(keyCode == 32)
  {
    z.jump();
  }
}
