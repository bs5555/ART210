ourSquare[] sq = new ourSquare[100];

void setup()
{
  size(1000,1000);
  int counter = 0;
  for(int y = 0; y<1000; y = y + 100)
  {
    for(int x = 0; x<1000; x = x + 100)
    {
      sq[counter]= new ourSquare(x,y);
      counter=counter+1;
    }  
  }
}

void draw()
{
  for(int i = 0; i<sq.length; i=i+1)
  {
    sq[i].randomize();
    sq[i].show();
  }
  
}

void mouseClicked() 
{
  for(int i = 0; i<sq.length; i=i+1)
  {
    sq[i].clicked(mouseX,mouseY);
  }
}
