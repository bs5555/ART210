PImage myImg;

void setup()
{
  size(2000,1000);
  myImg=loadImage("i.jpg");
  /*myImg.loadPixels();
   for(int i=0; i<(myImg.width*myImg.height); i++)
   {
     color c = myImg.pixels[i];
     float red = red(c);
     float green = green(c);
     float blue = blue(c);
     myImg.pixels[i]=color(red,green,blue);
   }  
   myImg.updatePixels();
   */
   /*
   myImg.filter(BLUR);
   */
   
   
}

void draw()
{
   noStroke();
   fill(color(255,255,255));   
   rect(0,0,width,height);
   int size = mouseX;
   if(size<2) size=2;
   if(size>1000) size=1000;
   for(int x=0; x<myImg.width; x=x+size)
   {
      for(int y=0; y<myImg.height; y=y+size)
      {
        color pixel=myImg.get(x,y);
        float radius = (red(pixel)/255)*size;
        noStroke();
        fill(color(0,0,0));
        ellipse(x,y,radius,radius);
      }
   }
}
