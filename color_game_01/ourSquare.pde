class ourSquare
{
  float xpos =0;
  float ypos = 0;
  float w = 100;
  float h = 100;
  color fillc = color(255,255,100); 
  int timer = 0;
  
  ourSquare(float xval, float yval)
  {
    this.xpos = xval;
    this.ypos = yval;
  }
  
  void show()
  {
    pushMatrix();
    translate(this.xpos,this.ypos);
    fill(this.fillc);
    noStroke();
    rect(0,0,this.w,this.h);
    popMatrix();
    if(this.timer > 0) this.timer = this.timer - 1;
  }
  
  void randomize()
  {
    colorMode(HSB, 255);
    float hue = hue(this.fillc)+random(1);
    if(hue<0) hue = 255;
    if(hue>255) hue = 0;
    float sat = saturation(this.fillc);
    float val = brightness(this.fillc);
    if(this.timer <= 0) this.fillc = color(hue,sat,val);
  }
  
  void clicked(int x, int y)
  {
    if(x > this.xpos && x < this.xpos+this.w && y > this.ypos && y < this.ypos+this.h)
    {
      this.timer = 1000;
      colorMode(RGB, 255);
      this.fillc = color(255,125,0);
    }
  }
}
