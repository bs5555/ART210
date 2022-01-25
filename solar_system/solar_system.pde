int c = 0; //global angle

void setup()
{
  size(1000,1000);
}

void draw()
{
  fill(color(255,255,255,20));
  rect(0,0,width,height); //clearin the screen with a semitransparent rectangle (trick to get trails)
  translate(width/2,height/2); //initial translation to see ths Sun in the center
  scale(0.5);                  //zoom in - zoom out 1.0 = 100%  0.5 = 50% 2.0 = 200% zoom  
  
  planet(80.0,color(250,200,0),0,0); //Sun
  
  pushMatrix();
    planet(60.0,color(100,200,255),c,200); //Earth
    planet(20.0,color(100,200,0),c * 3,100); //Moon
  popMatrix();  
  
  pushMatrix();
      planet(10.0,color(0,0,100),c,80);  //Mars
  popMatrix();
  
  c = c + 1; //global angle increasing
}

void planet(float radius, color col, float c, float dist)
{
  rotate(radians(c));
  translate(0,dist);
  fill(col);
  noStroke();
  ellipse(0,0,radius,radius);
}
