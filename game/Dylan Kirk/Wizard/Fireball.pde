class Fire{
  float w = 60;
  float h = 50;
  float posX, posY;
  int flapCount = 0;
  
  Fire(int t){
    posX = width;
    switch(t){
      case 0: posY = 10 + h / 4;
              break;
      case 1: posY = 60;
              break;
      case 2: posY = 130;
              break;
    }
  }
  
  void show(){
    flapCount++;
    if(flapCount < 0){
      image(Fireball1, posX - Fireball1.width / 2, height - groundHeight - (posY + Fireball1.height - 20));
    }
    else{
      image(Fireball2, posX - Fireball2.width / 2, height - groundHeight - (posY + Fireball2.height - 20));
    }
    if(flapCount > 15){
      flapCount = -15;
    }
  }
  
  void move(float speed){
    posX -= speed;
  }
  
  boolean collided(float playerX, float playerY, float playerWidth, float playerHeight){
    float playerLeft = playerX - playerWidth / 2;
    float playerRight = playerX + playerWidth / 2;
    float thisLeft = posX - w / 2;
    float thisRight = posX + w / 2;
    
    if(playerLeft < thisRight && playerRight > thisLeft){
      float playerDown = playerY - playerHeight / 2;
      float playerUp = playerY + playerHeight / 2;
      float thisUp = posY + h / 2;
      float thisDown = posY - h / 2;
      if(playerDown <= thisUp && playerUp >= thisDown){
        return true;
      }
    }
    return false;
  }
}
