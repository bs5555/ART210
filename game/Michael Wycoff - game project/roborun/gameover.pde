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
    s.loadFrame("bomb1.png");
    s.loadFrame("bomb2.png");
  }

  void show()
  {
    fill(color(0, 0, 0, 10));
    noStroke();
    rect(0, 0, width, height);
    textAlign(CENTER);
    textFont(font);
    pushMatrix();
      translate(width/2, height/3);
      rotate(radians(random(2)));
      fill(color(255, 50, 50, 50));
      text("you broke", 0, 0);
    popMatrix();
    pushMatrix();
      translate(width/2, height/2);
      textFont(fonts);
      text("Press any key to restart", 0, 0);
    popMatrix();
    pushMatrix();
      translate(width/2, height/2+160);
      textFont(font);
      text(end_score, 0, 0);
    popMatrix();
   
    pushMatrix();

      translate(width/2, height/2+60);
      textFont(fonts);
      text("Score:", 0, 0);
    popMatrix();
  }
}
