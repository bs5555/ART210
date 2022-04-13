class startscreen
{
  sprite s;
  sprite sky;
  sprite clouds;
  startscreen()
  {
    s = new sprite();
    sky = new sprite();
    clouds = new sprite();

    s.cx=width/2.0;
    s.cy=height-200;
    s.dir=270;
    s.speed=0;
    //s.loadFrame("skull1.png");
    s.loadFrame("Dirt.png");
    sky.loadFrame("sky.png");
    sky.dir=270;
    sky.speed=0;

    clouds.loadFrame("Clouds.png");
    clouds.dir=270;
    clouds.speed=0;
  }

  void txt(float scale, String txt, float cx, float cy, float angle, color col, float size)
  {
    noStroke();
    fill(col);
    textAlign(CENTER);
    if (size==1)
    {

      textFont(font);
    } else
    {
      textFont(fonts);
    }

    pushMatrix();
    scale(scale);
    translate(cx, cy);
    rotate(radians(angle));
    text(txt, 0, 0);
    popMatrix();
  }

  void show()
  {
    fill(color(51, 136, 222, 255));
    noStroke();
    rect(0, 0, width, height);
    sky.show();
   
    clouds.show();
    this.txt(1, "Robot RUN", width/2+5, (height/2)-(8*(sin(millis()/180))), 0, 5, 1);
    this.txt(1, "Robot RUN", width/2, (height/2)-(8*(sin(millis()/180)))-5, 0, 255, 1);
    this.txt(1, "Press any key to start", width/2, (height/1.5)-50, 0, 0, 0);
    s.cx=width/2.0;
    s.cy=height-100;
    s.show();
  }
}
