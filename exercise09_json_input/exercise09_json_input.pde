import peasy.*;
PeasyCam cam;
PFont f;

bsData d;

void setup()
{
  size(800,800,P3D);
  cam = new PeasyCam(this, 220);
  cam.setMinimumDistance(100);
  cam.setMaximumDistance(500);
  
  f = createFont("opensans_ebold.ttf", 12);
  textFont(f);
  
  d=new bsData("coffe.json");   //add your json file
  d.addField("caffeine","int"); //add a fieldname in the json and its type
  d.addField("calories","int");
  d.addField("price","float"); 
  d.addField("coffee","string");
  d.read();                     //read the all stuff
  d.normalize(0,100);            //normalise data
  
  /*for(int i=0; i<d.size(); i++)
  {
    print(d.get(i,"coffee"));
    print(": ");
    print(d.get(i,"caffeine"));
    print(", ");
    print(d.get(i,"calories"));
    print(", ");
    print(d.get(i,"price"));
    println("");
  } */ 
}

void draw()
{
  background(0);
  setLight();
  translate(-50,-50);
  for (int i = 0; i < d.size(); i++) 
  {
    drawMe(
     d.get(i,"coffee"),
     float(d.get(i,"caffeine")),
     float(d.get(i,"calories")),
     float(d.get(i,"price"))
    );
  }
  stroke(255,255,255);
  line(-10,0,0,100,0,0); text("caffeine",120,0,0);  
  line(0,-10,0,0,100,0); text("calories",0,120,0);
  line(0,0,-10,0,0,100); text("price",0,0,120);
}

void drawMe(String name, float caffeine, float calories, float price)
{
  pushMatrix();
   translate(caffeine,calories,price);
   noStroke();
   fill(caffeine,calories,price);
   box(10);
   float x = screenX(0,0);
   float y = screenY(0,0);
   cam.beginHUD();
    fill(255,255,255);
    text(name, x, y);
   cam.endHUD();
 popMatrix();   
}

void setLight()
{
  shininess(10.0);                        //shininess of the objects we draw
  lightSpecular(200,200,200);             //specular light color
  directionalLight(153,153,255,-1,0,0);   //directional light
  pointLight(50,50,200,65,60,100);        //a spotlight
  ambientLight(102,102,204);              //ambient light
  specular(255,255,255);                  //specular color of the objects

}
