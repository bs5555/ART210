class zman
{
  sprite s;               //zman srpite
  int state = 0;          //0 = running, 1 = jumping, 2 = falling
  float jumpSpeed = 100;  //starting speed
  float grav = 0;         //local copy of gravity

  zman(float gravity)
  {
    this.grav = gravity;
    this.s = new sprite();
    this.s.cx=200;
    this.s.loadFrame("character1.png");
    this.s.loadFrame("character2.png");
  }
  
  void step()
  {
    if(this.state == 1) //jumping up
    {
      this.s.speed = this.s.speed / this.grav;
      if(this.s.speed < 0.5) 
      {
        this.state =  2;
        this.s.speed = 0.5;
        this.s.dir = 0;
      }
    }
  
    if(this.state == 2) //falling down
    {
      this.s.speed = this.s.speed * this.grav;
      if(this.s.cy >= height/2)
      {
        this.s.speed = 0;
        this.state = 0;
        this.s.cy = height/2;
      }
    }
  }
  
  void show()
  {
    this.s.step();
    this.s.show();
  }
  
  void jump()
  {
   if(this.state == 0)
    {
      this.state = 1;
      this.s.speed = jumpSpeed; 
      this.s.dir = 180.0;
    }
  }
}
