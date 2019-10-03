
import peasy.*;

JSONArray json;
ArrayList<booze> boozes = new ArrayList<booze>();
float caffeine_min=1000000;
float caffeine_max=-1000000;
float calory_min=1000000;
float calory_max=-1000000;
float price_min=1000000;
float price_max=-1000000;

PeasyCam cam;


void setup()
{
  json = loadJSONArray("coffe.json");
  for (int i = 0; i < json.size(); i++) 
  {   
    JSONObject boozeJ = json.getJSONObject(i);
    //println(booze);
    float cof = boozeJ.getInt("caffeine");
    float pri = boozeJ.getFloat("price");
    float cal = boozeJ.getInt("calories");
    boozes.add(new booze(boozeJ.getString("coffee"),cof,pri,cal,boozeJ.getString("category")));
    if(cof > caffeine_max) caffeine_max=cof;
    if(cof < caffeine_min) caffeine_min=cof;
    if(pri > price_max) price_max=pri;
    if(pri < price_min) price_min=pri;
    if(cal > calory_max) calory_max=cal;
    if(cal < calory_min) calory_min=cal;
  }
  for (int i = 0; i < boozes.size(); i++) 
  {
    booze boo = boozes.get(i);
    boo.normMe("caffeine",caffeine_min,caffeine_max);
    boo.normMe("price",price_min,price_max);
    boo.normMe("calories",calory_min,calory_max);
    
    println(boo.calories);
  }
  
  println("-------");
  println(calory_min);
  println(calory_max); 
  
  size(800,800,P3D);
  cam = new PeasyCam(this, 220);
  cam.setMinimumDistance(100);
  cam.setMaximumDistance(500);
  
 
  
}

void draw()
{
  background(0);
  shininess(10.0);                        //shininess of the objects we draw
  lightSpecular(200,200,200);             //specular light color
  directionalLight(153,153,255,-1,0,0);   //directional light
  pointLight(50,50,200,65,60,100);        //a spotlight
  ambientLight(102,102,204);              //ambient light
  specular(255,255,255);                  //specular color of the objects
  
  translate(-50,-50);
  for (int i = 0; i < boozes.size(); i++) 
  {
    boozes.get(i).drawMe();
  }
  stroke(255,255,255);
  line(-10,0,0,100,0,0); text("caffeine",120,0,0);  
  line(0,-10,0,0,100,0); text("calories",0,120,0);
  line(0,0,-10,0,0,100); text("price",0,0,120);
}



class booze
{
  float caffeine = 0.0;
  float price = 0.0;
  float calories = 0.0;
  String name = "";
  String category = "";
  
  booze(String n, float caf, float pri, float cal, String cat)
  {
    name=n;
    caffeine=caf;
    price=pri;
    calories=cal;
    category = cat;
  }
  
  void normMe(String what, float min, float max)
  {
    switch(what)
    {
      case "caffeine" : caffeine=map(caffeine, min, max,0,100); break;
      case "price" :    price=map(price, min, max,0,100); break;
      case "calories" : calories=map(calories, min, max,0,100); break;
    }
  }
  
  void drawMe()
  {
    pushMatrix();
     translate(caffeine,calories,price);
     noStroke();
     fill(255,100,100);
     box(10);
     float x = screenX(0,0);
     float y = screenY(0,0);
     cam.beginHUD();
      fill(255,255,255);
      text(name, x, y);
     cam.endHUD();
    popMatrix();
    
  }
}
