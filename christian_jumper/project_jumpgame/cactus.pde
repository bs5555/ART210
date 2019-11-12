class cactus
{
  anim cactuses[]=new anim[3];
  int max=10;
  int from = 0;
  
  cactus(int f,int n)
  {
    //make clouds
    this.from=f;
    this.max=n;
    cactuses[0]=new anim(1);
    cactuses[0].addFrame("cacti_small.png");
    cactuses[1]=new anim(1);
    cactuses[1].addFrame("cacti_medium.png");
    cactuses[2]=new anim(1);
    cactuses[2].addFrame("cacti_big.png");
    for(int i=this.from; i<this.max; i++)
    {
      sprites.add(new sprite(random(width),height-(height/3),3,new vec2(-2,0),cactuses[floor(random(3))]));
    } 
  }
  
  void check()
  {
    for(int i=this.from; i<this.max; i++)
    {
      sprite buf=sprites.get(i);
      if(buf.x < -40) 
      {
        buf.x=width+random(100);
        buf.animation=cactuses[floor(random(3))];
        sprites.set(i,buf);
      }  
    }
  }
  
}
