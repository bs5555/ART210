class zman
{
  sprite s;               //zman sprite
  sprite r;               //zman runs
  sprite d;               //zman dead
  
  int state = 0;          //0 = running, 1 = jumping, 2 = falling -1=dead
  float jumpSpeed = 100;  //starting speed
  float grav = 0;         //local copy of gravity
  float groundLevel = 500; //ground level in pixels for zman

  zman(float gravity)
  {
    this.grav = gravity;
    this.r = new sprite();
    this.r.cx=200;
    this.r.cy=this.groundLevel;
    this.r.loadFrame("character1.png");
    this.r.loadFrame("character2.png");
    
    this.d = new sprite();
    this.d.loadFrame("character3.png");
    this.d.loadFrame("character3.png");
    this.s = r;
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
      if(this.s.cy >= this.groundLevel)
      {
        this.s.speed = 0;
        this.state = 0;
        this.s.cy = this.groundLevel;
      }
    }
  }
  
  void show()
  {
    if(this.state >= 0)
    {
      this.s.step();
      pushMatrix();
      translate(this.s.im[0].width/-2.0,this.s.im[0].height/-2.0);
      this.s.show();
      popMatrix();
    }
    else
    {
      this.s=d;
      this.s.show();
    }
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
  
  void die()
  {
    this.state = -1;
  }
}
