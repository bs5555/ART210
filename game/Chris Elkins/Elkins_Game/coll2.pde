class coll2
{
  ArrayList<sprite> n = new ArrayList<sprite>();  //characters
  ArrayList<sprite> l = new ArrayList<sprite>(); //bat
  
  coll2()
  {
    
  }
  
  void addCharacter(sprite character)
  {
    this.n.add(character);
  }
  
  void removeCharacter(int ch)
  {
    this.n.remove(ch);
  }
  
  void addBat(sprite bat)
  {
    this.l.add(bat);
  }
  
  void removeBat(int bo)
  {
    this.l.remove(bo);
  }
  
  boolean detect(int ch)
  {
    for(int i = 0; i < l.size(); i++)
    {
      sprite cc = n.get(ch);
      sprite bb = l.get(i);
      float d = dist(bb.cx,bb.cy,cc.cx,cc.cy);
      if(d < (cc.collision+bb.collision)) return(true);
    }
    return(false);
  }
  
  
  
}
