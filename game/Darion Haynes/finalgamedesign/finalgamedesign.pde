

football football;
PImage fImg;
PImage lImg;
PImage bImg;
ArrayList<bear> bears = new ArrayList<bear>();


void mousePressed() {
  bears.add(new bear());
}

void setup() {
  size(800, 450);
  fImg = loadImage("playerf.png");
  lImg = loadImage("bearlogo.png");
  bImg = loadImage("ffield.png");
  football = new football();
}


void keyPressed() {
  if (key == ' ') {
    football.jump();
  }
}

void draw() {

  if (random(1) < 0.008) {
    bears.add(new bear());
  }

  background(bImg);
  for (bear t : bears) {
    t.move();
    t.show();
    if (football.hits(t)) {
      print("game over");
      noLoop();
    }
  }

  football.show();
  football.move();
}
