
class bear {
  int r;
  float x, y;
  bear() {
    this.r = 75;
    this.x = width;
    this.y = height - this.r;
  }

  void move() {
    this.x -= 18;
  }

  void show() {
    image(lImg, this.x, this.y, this.r, this.r);

    
  }
}
