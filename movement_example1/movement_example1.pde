float cx = 0;
float cy = 0;

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
    translate(cx,cy);
    circle(0,0,100);
  popMatrix(); 
  
  cx = cx + 1;
  cy = cy + 1;
  
  if(cx < 0) cx = width;
  if(cx > width) cx = 0;
  if(cy < 0) cy = height;
  if(cy > height) cy = 0;
  

}
