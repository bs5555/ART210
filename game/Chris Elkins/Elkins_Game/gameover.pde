class gameover
{
  sprite s;
  
  gameover()
  {
    s = new sprite();
    s.cx=width/2.0;
    s.cy=height-200;
    s.dir=270;
    s.speed=0;
    s.loadFrame("skull1.png");
    s.loadFrame("skull2.png");
  }
  
  void show()
  {

     textAlign(CENTER);
    textFont(fonts);
    pushMatrix();
      translate(width/2,height/3);
      //rotate(radians(random(2)));
      text("Game Over",0,0);
    popMatrix();
    pushMatrix();
      translate(width/2,height/2);
      textFont(fontEnd);
      text("Press any key to restart",0,0);
    popMatrix();
  }
}
