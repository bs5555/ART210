class boulders
{
  ArrayList<sprite> b = new ArrayList<sprite>();
  int nBoulders = 2;
  float ground_level = 100;
  float tempSpeed;

boulders(float panSpeed, float level)
{
  for(int i=0; i<nBoulders; i=i+1)
  {
    this.ground_level = level;
    sprite temp = new sprite();
    temp.cx=width+random(width);
    temp.cy=this.ground_level+random(20);
    temp.dir=270;
    temp.speed=panSpeed;
    tempSpeed = panSpeed;
    
    temp.loadFrame("bomb1.png");
    temp.loadFrame("bomb2.png");
    b.add(temp);
    c.addBoulder(b.get(i));
    
  }
}

void show()
{
  for(int i=0; i<b.size(); i=i+1)
  {
    sprite temp = b.get(i);
    temp.step();
    temp.show();
    //temp.showBox();
  }
}

void step()
{
  for(int i=0; i<b.size(); i=i+1)
  {
    sprite temp = b.get(i);
    if(temp.cx <= 0) 
    {
      c.removeBoulder(i);
      b.remove(i);
      temp.cx=width+random(width*3);
      temp.cy=this.ground_level+random(20);
      temp.dir=270;
      temp.speed=tempSpeed;
      temp.nImg = 0;
      temp.loadFrame("bomb1.png");
      temp.loadFrame("bomb2.png");
      b.add(temp);
      c.addBoulder(b.get(i));
    }
  }
}
 void stop()
 {
   for(int i=0; i<nBoulders; i=i+1)
  {
    b.get(i).speed = 0;
  }
 }
 void setSpeed(float inSpeed){
    this.tempSpeed = 15+inSpeed;
  }

}
