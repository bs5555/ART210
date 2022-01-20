void setup()
{
   size(1000,1000);
}

void draw()
{
   for(int x = 0; x < 1000; x=x+100)
   {
     for(int y = 0; y < 1000; y=y+100)
     {        
       rect(x,y,100,100); //Draws the rectangles
     }  
   }
   
}

/* 
This is my first example
It will become a chess-board
*/
