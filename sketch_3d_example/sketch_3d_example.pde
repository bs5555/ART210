void setup()
{
  size(1000,1000,P3D);
}

void draw()
{
  
  fill(color(0,0,0));
  rect(0,0,width,height);
  translate(232, 192, 100);
  rotateY(radians(mouseX));
  rotateX(radians(mouseY));
  for(int x = 0; x < 12; x = x + 1)
  {
    for(int y = 0; y < 12; y = y + 1)
    {
      for(int z = 0; z < 12; z = z + 1)
      {
        fill(color(x*20,y*20,z*20));
        noStroke();
        pushMatrix();
        translate(x*20,y*20,z*20);
        box(10);
        popMatrix();
      }
    }  
  }
  
}
