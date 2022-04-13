class coll
{
  ArrayList<sprite> c = new ArrayList<sprite>();  //characters
  ArrayList<sprite> b = new ArrayList<sprite>(); //boulders
  
  coll()
  {
    
  }
  
  void addCharacter(sprite character)
  {
    this.c.add(character);
  }
  
  void removeCharacter(int ch)
  {
    this.c.remove(ch);
  }
  
  void addBoulder(sprite boulder)
  {
    this.b.add(boulder);
  }
  
  void removeBoulder(int bo)
  {
    this.b.remove(bo);
  }
  
  boolean detect(int ch)
  {
    for(int i = 0; i < b.size(); i++)
    {
      sprite cc = c.get(ch);
      sprite bb = b.get(i);
      float d = dist(bb.cx,bb.cy,cc.cx,cc.cy);
      if(d < (cc.collision+bb.collision)) return(true);
    }
    return(false);
  }
  
  
  
}
