class ground
{
  sprite gr;
  sprite gr1;
  
ground()
{
  this.gr = new sprite();
  this.gr.cx = 0;
  this.gr.cy = 550;
  this.gr.dir=270;
  this.gr.speed=15;
  this.gr.loadFrame("ground.png");
  
  this.gr1 = new sprite();
  this.gr1.cx = gr.im[0].width;
  this.gr1.cy = 550;
  this.gr1.dir=270;
  this.gr1.speed=15;
  this.gr1.loadFrame("ground.png");
}

void step()
{
  if(this.gr1.cx <= 0)
  {
    this.gr.cx = this.gr1.cx+this.gr.im[0].width;
  }
  if(this.gr.cx <= 0)
  {
    this.gr1.cx = this.gr.cx+this.gr.im[0].width;
  }
}

void stop()
{
   this.gr.speed=0;
   this.gr1.speed=0;
}

void show()
{
  this.gr.step();
  this.gr1.step();
  pushMatrix();
  translate(this.gr.im[0].width/2.0,this.gr.im[0].height/2.0);
  this.gr.show();
  this.gr1.show();
  popMatrix();
}
}
