void setup()
{
   size(1000,1000);
}

void draw()
{
   color white = color(255,255,255);
   color black = color(0,0,0);
   int counter = 0;
   
   for(int x = 0; x < 1000; x=x+100)
   {
     for(int y = 0; y < 1000; y=y+100)
     {  
       if(counter % 2 == 0)
       {
         fill(white);
       }
       else
       {
         fill(black);
       }
       counter = counter+1;
       rect(x,y,100,100); //Draws the rectangles
     } 
     counter = counter+1;
   }
   
}

/* 
This is my first example
It will become a chess-board
*/
