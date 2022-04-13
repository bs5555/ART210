class displayScore
{
  displayScore()
  {
    
  }
  
  void show()
  {
   this.txt(Integer.toString(scoreCount),870,150,0,color(255,255,255),50); 
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
