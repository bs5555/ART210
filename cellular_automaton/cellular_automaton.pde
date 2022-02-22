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

  if(gameon)
  {
    for(int y = 0; y<maxx; y = y + 1)
    {
      for(int x = 0; x<maxy; x = x + 1)
      {
        cells[x][y].examine();
      }  
    }
  }  
  
  for(int y = 0; y<maxx; y = y + 1)
  {
    for(int x = 0; x<maxy; x = x + 1)
    {
      cells[x][y].show();
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
