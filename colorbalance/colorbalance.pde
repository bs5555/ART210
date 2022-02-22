import controlP5.*;

ControlP5 cp5;
float huemin = 0;
float huemax = 360;
float satmin = 0;
float satmax = 100;
float valmin = 0;
float valmax = 100;
float speed = 0;

void setup()
{
   size(1200,1000);
   colorMode(HSB,huemax,satmax,valmax);
   controls();
}

void draw()
{
  strokeWeight(random(50));   
  stroke(randomC()); 
  for(int x = 0; x < 1000; x=x+100)
  {
    for(int y = 0; y < 1000; y=y+100)
    {  
      fill(randomC());
      rect(x,y,100,100); //Draws the rectangles
    } 
  }
  noStroke();
  fill(color(0,0,80));
  rect(1000,0,200,1000);
  adjustControls();
}

color randomC()
{
  int hue = round(random(huemin,huemax));
  int sat = round(random(satmin,satmax));
  int val = round(random(valmin,valmax));
  return(color(hue,sat,val));
}

void setHue()
{
  float min = cp5.getController("hue minimum").getValue();
  float max = cp5.getController("hue maximum").getValue();
  if(max<min) max=min;
  huemax=max;
  huemin=min;
}

void setSat()
{
  float min = cp5.getController("saturation minimum").getValue();
  float max = cp5.getController("saturation maximum").getValue();
  if(max<min) max=min;
  satmax=max;
  satmin=min;
}

void setVal()
{
  float min = cp5.getController("lightness minimum").getValue();
  float max = cp5.getController("lightness maximum").getValue();
  if(max<min) max=min;
  valmax=max;
  valmin=min;
}

void adjustControls()
{
  cp5.getController("hue minimum").setValue(huemin);
  cp5.getController("hue maximum").setValue(huemax);
  cp5.getController("saturation minimum").setValue(satmin);
  cp5.getController("saturation maximum").setValue(satmax);
  cp5.getController("lightness minimum").setValue(valmin);
  cp5.getController("lightness maximum").setValue(valmax);
}

public void controlEvent(ControlEvent theEvent) 
{
   int name = theEvent.getController().getId();   
   switch(name)
   {
     case 1 : setHue(); break;
     case 2 : setHue(); break;
     case 3 : setSat(); break;
     case 4 : setSat(); break;
     case 5 : setVal(); break;
     case 6 : setVal(); break;
   }   
}

void controls()
{
  cp5 = new ControlP5(this);
  cp5.addSlider("hue minimum").setPosition(1010,10).setSize(180,30).setNumberOfTickMarks(37).setRange(0,huemax).setValue(huemin).setId(1).getCaptionLabel().align(CENTER,CENTER);
  cp5.addSlider("hue maximum").setPosition(1010,50).setSize(180,30).setNumberOfTickMarks(37).setRange(0,huemax).setValue(huemax).setId(2).getCaptionLabel().align(CENTER,CENTER);
  
  cp5.addSlider("saturation minimum").setPosition(1010,120).setSize(180,30).setNumberOfTickMarks(11).setRange(0,satmax).setValue(satmin).setId(3).getCaptionLabel().align(CENTER,CENTER);
  cp5.addSlider("saturation maximum").setPosition(1010,170).setSize(180,30).setNumberOfTickMarks(11).setRange(0,satmax).setValue(satmax).setId(4).getCaptionLabel().align(CENTER,CENTER);
  
  cp5.addSlider("lightness minimum").setPosition(1010,240).setSize(180,30).setNumberOfTickMarks(11).setRange(0,valmax).setValue(valmin).setId(5).getCaptionLabel().align(CENTER,CENTER);
  cp5.addSlider("lightness maximum").setPosition(1010,290).setSize(180,30).setNumberOfTickMarks(11).setRange(0,valmax).setValue(valmax).setId(6).getCaptionLabel().align(CENTER,CENTER);
}
