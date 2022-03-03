float cx = 0;
float cy = 0;

float angle = 0;

void setup()
{
  size(1000,600);
  cx = width/2;
  cy = height/2;
}

void draw()
{
  background(0);
  pushMatrix();
    translate(cx+sin(radians(angle))*300,cy);
    circle(0,0,100);
  popMatrix(); 
  
  angle = angle + 1;
  if(angle > 360) angle = 0;
  
  
  

}
