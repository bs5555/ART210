PImage background;
PImage astro;
PImage halo;
PImage ship;
ArrayList<sprite> rocks=new ArrayList<sprite>();
float x;
float y;
float cx;
float cy;
ship enterprise;


void setup()
{
  size(1920,1080);
  background=loadImage("space.png");
  astro=loadImage("astronaut.png");
 halo=loadImage("halo.png");
 ship=loadImage("ship.png");
  for(int i=0;i<5;i++)
  {
    rocks.add(new sprite("rock1.png"));
    rocks.add(new sprite("rock2.png"));
    rocks.add(new sprite("rock3.png"));
    rocks.add(new sprite("rock4.png"));
    rocks.add(new sprite("rock5.png"));
  }
  cx=100;
  cy=height-100;
  x=-100;
  y=height+100;
  enterprise= new ship();
}

void draw()
{
  image(background,0,0);
  for(int i=0;i<rocks.size();i++)
  {
    rocks.get(i).showme();
  }
  move();
  enterprise.showme();
}



class ship
{
  PImage img;
  float radius;
  float x,y;
  float a;
  float b;
  
  ship()
  {
    img=ship;
    x=width-img.width/2;
    y=img.height;
    a=0;
  }
  void showme()
  {
    pushMatrix();
    float cy=sin(radians(a))*20;
    translate(x,y+cy);
    rotate(radians(sin(b)*3));
    //translate(-img.width/2,0);
    image(img,img.width/-2,img.height/-2);
    popMatrix();
    a++;
    b=b+0.1;
  }
}

class sprite
{
  PImage img;
  float radius;
  float x,y;
  float a;
  float ad;
  float cx,cy;
  
  sprite(String imgname)
  {
    img=loadImage(imgname);
    cx=0;
    cy=10;
    x=random(0,width);
    y=random(0,height);
    a=random(0,360);
    ad=random(0.1,0.5);
    radius= sqrt(img.width*img.width+img.height*img.height);
  }
  
  void showme()
  {
   float theta=radians(random(10));
  cx = cx*cos(theta) - cy*sin(theta);
  cy = cy*cos(theta) - cx*sin(theta);
     x = cx;
     y = cy;
    this.a=this.a+this.ad;
    pushMatrix();
    translate(this.x,this.y);
    rotate(radians(this.a));
    ellipseMode(CENTER);
    ellipse(0,0,radius*0.8,radius*0.8);
    image(this.img,img.width/-2,img.height/-2);
    popMatrix();
  }
}

void move()
{
  if(mousePressed)
  {
    cx=mouseX;
    cy=mouseY;
  }
   // Here we are moving 5% of the way to the mouse location each frame
   x = lerp(x, cx, 0.05);
   y = lerp(y, cy, 0.05);
   
   float angle = (atan2(cy - y, cx - x))+radians(90);
   pushMatrix();
   translate(x,y);
   rotate(angle);
  
  image(halo,astro.width/-2,astro.height/-2,astro.width,astro.width);
  image(astro,astro.width/-2,astro.height/-2);
  popMatrix();
}
