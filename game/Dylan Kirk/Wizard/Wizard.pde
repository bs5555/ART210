PImage WizardRun1;
PImage WizardRun2;
PImage WizardJump;
PImage WizardDuck;
PImage WizardDuck1;
PImage smallEnemy;
PImage bigEnemy;
PImage manySmallEnemy;
PImage Fireball1;
PImage Fireball2;

ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Fire> Fire = new ArrayList<Fire>();
ArrayList<Ground> grounds = new ArrayList<Ground>();

int obstacleTimer = 0;
int minTimeBetObs = 60;
int randomAddition = 0;
int groundCounter = 0;
float speed = 10;

int groundHeight = 50;
int playerXpos = 100;
int highScore = 0;

Player Wizard;

void setup(){
  surface.setTitle("Wizard_Battle_v.01");
  surface.setIcon(loadImage("Enemy1.png"));
  size(800, 400);
  frameRate(40 );
  
  WizardRun1 = loadImage("Player1.png");
  WizardRun2 = loadImage("Player2.png");
  WizardJump = loadImage("Player4.png");
  WizardDuck = loadImage("Player3.png");
  WizardDuck1 = loadImage("Player5.png");
  smallEnemy = loadImage("Enemy1.png");
  bigEnemy = loadImage("Enemy.png");
  manySmallEnemy = loadImage("SpikesMany.png");
  Fireball1 = loadImage("Fireball1.png");
  Fireball2 = loadImage("Fireball2.png");
  
  Wizard = new Player();
}

void draw(){
  background(250);
  stroke(0);
  strokeWeight(2);
  line(0, height - groundHeight - 30, width, height - groundHeight - 30);
  
  updateObstacles();
  
  if(Wizard.score > highScore){
    highScore = Wizard.score;
  }
  
  textSize(20);
  fill(0);
  text("Score: " + Wizard.score, 5, 20);
  text("High Score: " + highScore, width - (140 + (str(highScore).length() * 10)), 20);
}

void keyPressed(){
  switch(key){
    case ' ': Wizard.jump();
              break;
    case 's': if(!Wizard.dead){
                Wizard.ducking(true);
              }
              break;
  }
}

void keyReleased(){
  switch(key){
    case 's': if(!Wizard.dead){
                Wizard.ducking(false);
              }
              break;
    case 'r': if(Wizard.dead){
                reset();
              }
              break;
  }
}

void updateObstacles(){
  showObstacles();
  Wizard.show();
  if(!Wizard.dead){
    obstacleTimer++;
    speed += 0.002;
    if(obstacleTimer > minTimeBetObs + randomAddition){
      addObstacle();
    }
    groundCounter++;
    if(groundCounter > 10){
      groundCounter = 0;
      grounds.add(new Ground());
    }
    moveObstacles();
    Wizard.update();
  }
  else{
    textSize(32);
    fill(0);
    text("BATTLE LOST", 300, 200);
    textSize(16);
    text("(Press 'r' to restart!)", 330, 230);
  }
}

void showObstacles(){
  for(int i = 0; i < grounds.size(); i++){
    grounds.get(i).show();
  }
  for(int i = 0; i < obstacles.size(); i++){
    obstacles.get(i).show();
  }
  for(int i = 0; i < Fire.size(); i++){
    Fire.get(i).show();
  }
}

void addObstacle(){
  if(random(1) < 0.15){
    Fire.add(new Fire(floor(random(3))));
  }
  else{
    obstacles.add(new Obstacle(floor(random(3))));
  }
  randomAddition = floor(random(50));
  obstacleTimer = 0;
}

void moveObstacles(){
  for(int i = 0; i < grounds.size(); i++){
    grounds.get(i).move(speed);
    if(grounds.get(i).posX < -playerXpos){
      grounds.remove(i);
      i--;
    }
  }
  for(int i = 0; i < obstacles.size(); i++){
    obstacles.get(i).move(speed);
    if(obstacles.get(i).posX < -playerXpos){
      obstacles.remove(i);
      i--;
    }
  }
  for(int i = 0; i < Fire.size(); i++){
    Fire.get(i).move(speed);
    if(Fire.get(i).posX < -playerXpos){
      Fire.remove(i);
      i--;
    }
  }
}

void reset(){
  Wizard = new Player();
  obstacles = new ArrayList<Obstacle>();
  Fire = new ArrayList<Fire>();
  grounds = new ArrayList<Ground>();
  
  obstacleTimer = 0;
  randomAddition = floor(random(50));
  groundCounter = 0;
  speed = 10;
}
