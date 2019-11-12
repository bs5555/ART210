class land
{
  color sky_begin;
  color sky_end;
  color mountain;
  color ground;
  float ground_height;
  PGraphics sky;
  float[] m =  new float[100];
  int step;
  float speed;
  
  land()
  {
    this.ground=color(255,210,0);
    this.ground_height=0.3;
    this.sky_begin=color(4,203,239);
    this.sky_end=color(255,255,255);
    this.speed=4;
    
    sky=createGraphics(width,ceil(height*(1.0-ground_height)));
    sky.beginDraw();
    for(float i = 0; i<sky.height; i++)
    {
      int red=round(lerp(red(sky_begin),red(sky_end),i/sky.height));
      int blue=round(lerp(blue(sky_begin),blue(sky_end),i/sky.height));
      int green=round(lerp(green(sky_begin),green(sky_end),i/sky.height));
      sky.stroke(color(red,green,blue));
      sky.line(0,i,sky.width,i);
    }
    sky.endDraw();
    this.mountain=color(0,131,174);
    step = width/100;
    for(int i=0; i<100; i++)
    {
      float f = (((sin(radians(i*2.7))+1) + (sin(radians(i*8))+1)))/2.0;
      this.m[i]=floor((f*5)+2)*step;
    }
  }
  
  void step()
  {
    for(int i=0; i<100; i++)
    {
      float t = d*speed;
      float f = (((sin(radians(t+i*2.7))+1) + (sin(radians(t+i*8))+1)))/2.0;
      this.m[i]=floor((f*5)+2)*step;
    }
  }
  
  void showMe()
  {
    background(ground);
    image(sky,0,0);
    noStroke();
    fill(mountain);
    if(STATE==1)
    {
      this.step();
    }
    for(int i=0; i<m.length; i++)
    {
      rect(i*step,height*(1.0-ground_height)-m[i],step,m[i]);
    }
  }
  
}
