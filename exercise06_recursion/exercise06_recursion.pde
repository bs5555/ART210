import processing.opengl.*;
import peasy.*;

PeasyCam cam;
 
void setup() {
  size(800,800,P3D);
  cam = new PeasyCam(this, 120);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
}

void Fractal(float x,float y,float z,float s, float f, int l){
  translate(x,y,z);
  noStroke();
  box(s);
  //sphere(s);
  l--;
  if (l>0) {
    float ox=-s/2;
    float oy=-s/2;
    float oz=-s/2;
     pushMatrix(); Fractal(ox,oy,oz,s*f,f,l); popMatrix();
     pushMatrix(); Fractal(ox+s,oy,oz,s*f,f,l); popMatrix();
     pushMatrix(); Fractal(ox,oy+s,oz,s*f,f,l); popMatrix();
     pushMatrix(); Fractal(ox+s,oy+s,oz,s*f,f,l); popMatrix();
     pushMatrix(); Fractal(ox,oy,oz+s,s*f,f,l); popMatrix();
     pushMatrix(); Fractal(ox+s,oy,oz+s,s*f,f,l); popMatrix();
     pushMatrix(); Fractal(ox,oy+s,oz+s,s*f,f,l); popMatrix();
     pushMatrix(); Fractal(ox+s,oy+s,oz+s,s*f,f,l); popMatrix();
  }
}
 
void draw() {
  background(color(0,0,0)); 
  shininess(10.0);                        //shininess of the objects we draw
  lightSpecular(200,200,200);             //specular light color
  directionalLight(153,153,255,-1,0,0);   //directional light
  pointLight(50,50,200,65,60,100);        //a spotlight
  ambientLight(102,102,204);              //ambient light
  specular(255,255,255);                  //specular color of the objects
  Fractal(0,0,0,40,0.4,4);
}
