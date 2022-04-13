class startscreen
{
  sprite s;
  
  startscreen()
  {
    s = new sprite();
    s.cx=width/2.0;
    s.cy=height-200;
    s.dir=270;
    s.speed=0;
    s.loadFrame("character1.png");
    s.loadFrame("character2.png");
  }
  
  void txt(String txt,float cx,float cy, float angle, color col, int size)
  {
    noStroke();
    fill(col);
    textAlign(CENTER);
    if(size==1) 
    {
      textFont(Title);
    }
    else
    {
      textFont(Text);
    }
    pushMatrix();
     translate(cx,cy);
     rotate(radians(angle));
     text(txt,0,0);
    popMatrix();
  }
  
  void show()
  {
    fill(color(0,100,200,255));
    noStroke();
    rect(0,0,width,height);
    this.txt("Cave Run",width/2,height/3,random(2),0,1);
    this.txt("Press any key to start",width/2,height/2+random(7),0,0,0);
    s.cx=width/2.0;
    s.cy=height-200;
    s.show();
  }
}
