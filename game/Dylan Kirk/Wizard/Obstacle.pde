class Obstacle{
  float posX;
  int w, h;
  int type;
  
  Obstacle(int t){
    posX = width;
    type = t;
    switch(type){
      case 0: w = 20;
              h = 40;
              break;
      case 1: w = 30;
              h = 60;
              break;
      case 2: w = 60;
              h = 40;
              break;
    }
  }
  
  void show(){
    switch(type){
      case 0: image(smallEnemy, posX - smallEnemy.width / 2, height - groundHeight - smallEnemy.height);
              break;
      case 1: image(bigEnemy, posX - bigEnemy.width / 2, height - groundHeight - bigEnemy.height);
              break;
      case 2: image(manySmallEnemy, posX - manySmallEnemy.width / 2, height - groundHeight - manySmallEnemy.height);
              break;
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
      float thisUp = h;
      if(playerDown < thisUp){
        return true;
      }
    }
    return false;
  }
}
