class startscreen
{
  ground g;
  startscreen()
  {
    this.g = new ground();
  }
  
  void show()
  {
    background(bg);
    this.g.step();
    this.g.show();
    this.txt("SCHNOZ",width/2,height/2,0,0,2);
    this.txt("ENTER THE QLIPHOTH", width/2,height/1.5,0,0,1);
    this.txt("PRESS SPACE ", width/2,height/1.39,0,0,1);
  }
  void txt(String txt,float cx, float cy, float angle, color col, int size)
  {
    noStroke();
    fill(col);
    textAlign(CENTER);
    if(size==1)
    {
     textFont(font); 
    }
    else
    {
     textFont(fonts); 
    }
    pushMatrix();
     translate(cx,cy);
     rotate(radians(angle));
     text(txt,0,0);
    popMatrix();
  }
}
 
