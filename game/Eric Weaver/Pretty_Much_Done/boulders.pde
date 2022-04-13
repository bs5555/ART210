 class boulders
{
  ArrayList<sprite> b = new ArrayList<sprite>();
  int nBoulders = 5;

boulders()
{
  for(int i=0; i<nBoulders; i=i+1)
  {
    sprite temp = new sprite();
    temp.cx=(width*2)+random(width*4);
    temp.cy=650+random(20);
    temp.dir=270;
    temp.speed=objectSpeed;
    temp.loadFrame("boulder1.png");
    temp.loadFrame("boulder1.png");
    temp.loadFrame("boulder1.png");
    temp.loadFrame("boulder2.png");
    temp.loadFrame("boulder2.png");
    temp.loadFrame("boulder2.png");
    temp.cImg = round(random(5));
    b.add(temp);
    c.addBoulder(b.get(i));
    temp.collision = 40;
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
      temp.cx=(width*2)+random(width*4);
      temp.cy=650+random(20);
      temp.dir=270;
      temp.speed=objectSpeed;
      temp.nImg = 0;
      temp.loadFrame("boulder1.png");
      temp.loadFrame("boulder1.png");
      temp.loadFrame("boulder1.png");
      temp.loadFrame("boulder2.png");
      temp.loadFrame("boulder2.png");
      temp.loadFrame("boulder2.png");
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
