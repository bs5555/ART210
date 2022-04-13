class ground
{
  sprite gr;
  sprite gr1;
  float ground_level = 200;
  float tempSpeed;
  
ground(float panSpeed,float level,String graphics)
{
  this.ground_level = level*0.9;
  
  this.gr = new sprite();
  this.gr.cx = 0;
  this.gr.cy = this.ground_level;
  this.gr.dir=270;
  this.gr.speed=panSpeed;
  this.tempSpeed = panSpeed;
  this.gr.loadFrame(graphics);
  
  this.gr1 = new sprite();
  this.gr1.cx = gr.im[0].width;
  this.gr1.cy = this.ground_level;
  this.gr1.dir=270;
  this.gr1.speed=panSpeed;
  this.gr1.loadFrame(graphics);
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
void setSpeed(float inSpeed){
  this.gr.speed =tempSpeed + inSpeed;
  this.gr1.speed = tempSpeed + inSpeed;
  }
}
