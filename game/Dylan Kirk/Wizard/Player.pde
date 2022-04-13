class Player{
  float posY = 0;
  float velY = 0;
  float gravity = 1.2;
  int size = 20;
  boolean duck = false;
  boolean dead = false;
  
  int runCount = -5;
  int lifespan;
  int score;
  
  Player(){
  }
  
  void jump(){
    if(posY == 0){
      gravity = 1.2;
      velY = 16;
    }
  }
  
  void show(){
    if(duck && posY == 0){
      if(runCount < 0){
        image(WizardDuck, playerXpos - WizardDuck.width / 2, height - groundHeight - (posY + WizardDuck.height));
      }
      else{
        image(WizardDuck1, playerXpos - WizardDuck1.width / 2, height - groundHeight - (posY + WizardDuck1.height));
      }
    }
    else{
      if(posY == 0){
        if(runCount < 0){
          image(WizardRun1, playerXpos - WizardRun1.width / 2, height - groundHeight - (posY + WizardRun1.height));
        }
        else{
          image(WizardRun2, playerXpos - WizardRun2.width / 2, height - groundHeight - (posY + WizardRun2.height));
        }
      }
      else{
        image(WizardJump, playerXpos - WizardJump.width / 2, height - groundHeight - (posY + WizardJump.height));
      }
    }
    
    if(!dead){
      runCount++;
    }
    if(runCount > 5){
      runCount = -5;
    }
  }
  
  void move(){
    posY += velY;
    if(posY > 0){
      velY -= gravity;
    }
    else{
      velY = 0;
      posY = 0;
    }
    
    for(int i = 0; i < obstacles.size(); i++){
      if(dead){
        if(obstacles.get(i).collided(playerXpos, posY + WizardDuck.height / 2, WizardDuck.width * 0.5, WizardDuck.height)){
          dead = true;
        }
      }
      else{
        if(obstacles.get(i).collided(playerXpos, posY + WizardRun1.height / 2, WizardRun1.width * 0.5, WizardRun1.height)){
          dead = true;
        }
      }
    }
    
    for(int i = 0; i < Fire.size(); i++){
      if(duck && posY == 0){
        if(Fire.get(i).collided(playerXpos, posY + WizardDuck.height / 2, WizardDuck.width * 0.5, WizardDuck.height)){
          dead = true;
        }
      }
      else{
        if(Fire.get(i).collided(playerXpos, posY + WizardRun1.height / 2, WizardRun1.width * 0.5, WizardRun1.height)){
          dead = true;
        }
      }
    }
  }
  
  void ducking(boolean isDucking){
    if(posY != 0 && isDucking){
      gravity = 3;
    }
    duck = isDucking;
  }
  
  void update(){
    incrementCounter();
    move();
  }
  
  void incrementCounter(){
    lifespan++;
    if(lifespan % 3 == 0){
      score += 1;
    }
  }
}
