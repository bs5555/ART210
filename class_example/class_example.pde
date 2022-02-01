void setup()
{
  size(1000,1000);
}

void draw()
{
  ourCircle cir = new ourCircle();
  cir.xpos = 100;
  cir.show();
}

class ourCircle
{
  float xpos =0;
  float ypos = 0;
  float radius = 100;
  color fillc = color(255,255,255); 
  color strokec = color(0,0,0);
  float strokew = 1.0;
  
  ourCircle()
  {
    
  }
  
  void show()
  {
    pushMatrix();
    translate(this.xpos,this.ypos);
    fill(this.fillc);
    stroke(this.strokec);
    circle(0,0,this.radius);
    popMatrix();
    
  }
}
