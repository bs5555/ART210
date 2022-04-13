class bat
{
  ArrayList<sprite> l = new ArrayList<sprite>();
  int nBats = 2;

bat()
{
  for(int i=0; i<nBats; i=i+1)
  {
    sprite temp = new sprite();
    temp.cx=width+random(width);
    temp.cy=150+random(250);
    temp.dir=270;
    temp.speed=25;
    temp.loadFrame("bat1.png");
    temp.loadFrame("bat2.png");
    l.add(temp);
    n.addBat(l.get(i));
    
  }
}

void show()
{
  for(int i=0; i<l.size(); i=i+1)
  {
    sprite temp = l.get(i);
    temp.step();
    temp.show();
    //temp.showBox();
  }
}

void step()
{
  for(int i=0; i<l.size(); i=i+1)
  {
    sprite temp = l.get(i);
    if(temp.cx <= 0) 
    {
      n.removeBat(i);
      l.remove(i);
      temp.cx=width+random(width*3);
      temp.cy=150+random(250);
      temp.dir=270;
      temp.speed=25;
          temp.nImg=0;
      temp.loadFrame("bat1.png");
      temp.loadFrame("bat2.png");
      l.add(temp);
      n.addBat(l.get(i));
    }
  }
}
 void stop()
 {
   for(int i=0; i<nBats; i=i+1)
  {
    l.get(i).speed = 0;
  }
 }

}
