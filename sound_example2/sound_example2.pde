import processing.sound.*;
Amplitude amp;
SoundFile sample;

void setup() {
  size(640, 360);
  background(255);
    
  // Create an Input stream which is routed into the Amplitude analyzer
  amp = new Amplitude(this);
  sample = new SoundFile(this, "beat.aiff");
  sample.loop();
  amp.input(sample);
}      

void draw() {
  //println(amp.analyze());
  fill(color(255,255,255,10));
  noStroke();
  rect(0,0,width,height);
  fill(0);
  circle(width/2,height/2,amp.analyze()*200.0);
}
