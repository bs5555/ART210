
class gameover
{
  ground g;
  startscreen s;
  gameover()
  {
    this.g = new ground();
  }
  
  void show()
  {
    background(bg);
    this.txt("THE THREADS BUNDLED",width/2,height/3,0,color(180,180,180),1);
    this.txt("BY THE LAWS OF CAUSALITY",width/2,height/2.4,0,color(180,180,180),1);
    this.txt("HAVE NOW BEEN BOUND",width/2,height/2,0,color(180,180,180),1);
    this.txt("BECOME BORN AGAIN",width/2,height/1.5,0,0,1);
    this.txt("PRESS SPACE",width/2,height/1.373,0,0,1);
    this.txt("LEAVE THE QLIPHOTH",width/2,height/1.2,0,0,1);
    this.txt("PRESS ESC",width/2,height/1.1,0,0,1);
    
  }
  void keyPressed()
  {
    if(keyCode==32)init();
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
 
