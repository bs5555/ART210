class background
{
  sprite bg;
  sprite bg1;
  
background()
{
  this.bg = new sprite();
  this.bg.cx = 0;
  this.bg.cy = -45;
  this.bg.dir=270;
  this.bg.speed=15;
  this.bg.loadFrame("background.png");
  
  this.bg1 = new sprite();
  this.bg1.cx = bg.im[0].width;
  this.bg1.cy = -45;
  this.bg1.dir=270;
  this.bg1.speed=15;
  this.bg1.loadFrame("background.png");
}

void step()
{
  if(this.bg1.cx <= 0)
  {
    this.bg.cx = this.bg1.cx+this.bg.im[0].width;
  }
  if(this.bg.cx <= 0)
  {
    this.bg1.cx = this.bg.cx+this.bg.im[0].width;
  }
}

void stop()
{
   this.bg.speed=0;
   this.bg1.speed=0;
}

void show()
{
  this.bg.step();
  this.bg1.step();
  pushMatrix();
  translate(this.bg.im[0].width/2.0,this.bg.im[0].height/2.0);
  this.bg.show();
  this.bg1.show();
  popMatrix();
}
}
