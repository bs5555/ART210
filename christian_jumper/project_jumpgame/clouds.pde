class clouds
{
  anim clouds[]=new anim[3];
  int max=10;
  int from = 0;
  
  clouds(int f,int n)
  {
    //make clouds
    this.from=f;
    this.max=n;
    clouds[0]=new anim(1);
    clouds[0].addFrame("cloud_small.png");
    clouds[1]=new anim(1);
    clouds[1].addFrame("cloud_medium.png");
    clouds[2]=new anim(1);
    clouds[2].addFrame("cloud_big.png");
    for(int i=this.from; i<max; i++)
    {
      sprites.add(new sprite(random(width),height/random(2,10),3,new vec2(-random(0.02,0.15),0),clouds[floor(random(3))]));
    } 
  }
  
  void check()
  {
    for(int i=this.from; i<this.max; i++)
    {
      sprite buf=sprites.get(i);
      if(buf.x < -100) 
      {
        buf.x=width+random(300);
        buf.y=height/random(2,10);
        buf.dir = new vec2(-random(0.02,0.15),0);
        sprites.set(i,buf);
      }  
    }
  }
  
}
