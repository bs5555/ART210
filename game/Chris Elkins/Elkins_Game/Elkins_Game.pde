class boulders
{
  ArrayList<sprite> b = new ArrayList<sprite>();
  int nBoulders = 3;
  float ground_level = 100;

boulders(float level)
{
  for(int i=0; i<nBoulders; i=i+1)
  {
    this.ground_level = level*0.88;
    sprite temp = new sprite();
    temp.cx=width+random(width);
    temp.cy=580+random(20);
    temp.dir=270;
    temp.speed=15;
    temp.loadFrame("skull1.png");
    temp.loadFrame("skull2.png");
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
      temp.cy=560+random(20);
      temp.dir=270;
      temp.speed=15;
      temp.nImg=0;
      temp.loadFrame("skull1.png");
      temp.loadFrame("skull2.png");
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

}
