class cell
{
  boolean live = false;
  float xpos =0;
  float ypos = 0;
  int xindex = 0;
  int yindex = 0;
  float w = 100;
  float h = 100;
  
  cell(int xval, int yval, float cw, float ch)
  {
    this.xindex=xval;
    this.yindex=yval;
    this.xpos = xval*cw;
    this.ypos = yval*ch;
    this.w = cw;
    this.h = ch;
  }
  
  void show(int xx, int yy)
  {
    if(this.live)
    {
      fill(color(255,255,255));
    }
    else
    {
      fill(color(100,100,100));
    }
    rect(this.xpos,this.ypos,this.w,this.h);
  }
  
  void clicked(int x, int y)
  {
    if(x > this.xpos && x < this.xpos+this.w && y > this.ypos && y < this.ypos+this.h)
    {
      if(this.live)
      {
        this.live = false;
      }
      else
      {
        this.live = true;
      }
    }
  }
  
  int checkNum(int n)
  {
    if(n < 0) n = 0;
    if(n > maxx-1) n = maxx-1;
    return(n);
  }
  
  void examine()
  {
    int sum = 0;
    sum = sum + int(cells[checkNum(this.xindex-1)][checkNum(this.yindex-1)].live);
    sum = sum + int(cells[checkNum(this.xindex  )][checkNum(this.yindex-1)].live);
    sum = sum + int(cells[checkNum(this.xindex+1)][checkNum(this.yindex-1)].live);
    sum = sum + int(cells[checkNum(this.xindex-1)][checkNum(this.yindex  )].live);
    sum = sum + int(cells[checkNum(this.xindex+1)][checkNum(this.yindex  )].live);
    sum = sum + int(cells[checkNum(this.xindex-1)][checkNum(this.yindex+1)].live);
    sum = sum + int(cells[checkNum(this.xindex  )][checkNum(this.yindex+1)].live);
    sum = sum + int(cells[checkNum(this.xindex+1)][checkNum(this.yindex+1)].live);
    
    this.live=false;
    if(sum <= 3) this.live=true;
    if(sum >= 6) this.live=false;
   
  }
}
