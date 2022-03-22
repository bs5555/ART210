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
  
  println(amp.analyze()*1000);
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
