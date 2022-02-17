
int maxx = 100;
int maxy = 100;

cell[][] cells = new cell[maxx][maxy];
boolean gameon = false;

void setup()
{
  size(1000,1000);
  for(int y = 0; y<maxx; y = y + 1)
  {
    for(int x = 0; x<maxy; x = x + 1)
    {
      cells[x][y]= new cell(x,y,width/maxx,height/maxy);
    }  
  }
}

void draw()
{
  for(int y = 0; y<maxx; y = y + 1)
  {
    for(int x = 0; x<maxy; x = x + 1)
    {
      cells[x][y].show(x,y);
      if(gameon) cells[x][y].examine();
    }  
  }
}



void mousePressed() 
{
  for(int y = 0; y<maxx; y = y + 1)
  {
    for(int x = 0; x<maxy; x = x + 1)
    {
      cells[x][y].clicked(mouseX,mouseY);
    }  
  }
}

void keyPressed()
{
   if(key == 's') 
   {
     if(gameon)
     {
       gameon = false;
     }
     else
     {
       gameon = true;
     }
   }
}
