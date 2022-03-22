class boulders
{
  ArrayList<sprite> b = new ArrayList<sprite>();
  int nBoulders = 5;

boulders()
{
  for(int i=0; i<nBoulders; i=i+1)
  {
    sprite temp = new sprite();
    temp.cx=width+random(width);
    temp.cy=580+random(20);
    temp.dir=270;
    temp.speed=15;
    b.add(temp);
  }
}

void show()
{
  for(int i=0; i<b.size(); i=i+1)
  {
    sprite temp = b.get(i);
    temp.step();
    temp.show();
  }
}

void step()
{
  for(int i=0; i<b.size(); i=i+1)
  {
    sprite temp = b.get(i);
    if(temp.cx <= 0) 
    {
      b.remove(i);
      temp.cx=width+random(width*3);
      temp.cy=580+random(20);
      temp.dir=270;
      temp.speed=15;
      b.add(temp);
    }
  }
}
}
