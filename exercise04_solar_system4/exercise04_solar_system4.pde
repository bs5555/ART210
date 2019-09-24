float x = 0;
float[] planet_radius = new float[30];
float[] planet_distance = new float[30];
float[] planet_speed = new float[30];
int[] planet_or_moon = new int[30];

void setup()
{
  size(800,600);
  for(int i=0; i<planet_radius.length; i++)
  {
    planet_radius[i]=random(5,10);
    planet_distance[i]=random(10,100);
    planet_speed[i]=random(0.1,1.2);
    planet_or_moon[i]=round(random(0,1));
  }  
 
  for(int i=0; i<planet_radius.length; i++)
  {
    print(planet_radius[i]);
    print(", ");
    print(planet_distance[i]);
    print(", ");
    print(planet_speed[i]);
    println();
  }  
}

void draw()
{
  noStroke();
  fill(color(255,255,255,20));
  rect(0,0,width,height);
  translate(width/2,height/2);
  for(int i=0; i<planet_radius.length; i++)
  {
    orbit(x*planet_speed[i],planet_distance[i], 0, color(10,50,100), planet_radius[i],planet_or_moon[i]);
  }
   
  x = x+1;
  
}

void orbit(float rotation,float transX, float transY, color c, float radius, int is_moon)
{
  if(is_moon < 1) pushMatrix();
  noStroke();                    //no strokes for nice trails  
  rotate(radians(rotation));     //rotate
  translate(transX,transY);      //translate
  fill(c);                       //set orbit color
  ellipse(0,0,radius,radius);    //draw a circle
  if(is_moon < 1) popMatrix();
}
