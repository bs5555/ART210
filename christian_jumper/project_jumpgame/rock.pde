class rocks
{
  anim clouds[]=new anim[3];
  int max=10;
  int from = 0;
  
  rocks(int f,int n)
  {
    //make rocks
    this.from=f;
    this.max=n;
    clouds[0]=new anim(1);
    clouds[0].addFrame("stone_small.png");
    clouds[1]=new anim(1);
    clouds[1].addFrame("stone_medium.png");
    clouds[2]=new anim(1);
    clouds[2].addFrame("stone_big.png");
    for(int i=this.from; i<max; i++)
    {
      sprites.add(new sprite(random(width*4)-(width*4),height-(height/10.0),3,new vec2(-2,0),clouds[floor(random(3))]));
    } 
  }
  
  void check()
  {
    for(int i=this.from; i<this.max; i++)
    {
      println(i);
      sprite buf=sprites.get(i);
      if(buf.x < -100) 
      {
        buf.x=width+random(300);
        sprites.set(i,buf);
      }  
    }
  }
  
}
