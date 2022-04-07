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
    fill(color(0,0,0,10));
    noStroke();
    rect(0,0,width,height);
    textAlign(CENTER);
    textFont(font);
    pushMatrix();
      translate(width/2,height/3);
      rotate(radians(random(2)));
      fill(color(255,0,100,255));
      text("happy end",0,0);
    popMatrix();
    pushMatrix();
      translate(width/2,height/2+random(10));
      textFont(fonts);
      text("Press any key to reincarnate",0,0);
    popMatrix();
  }
}
