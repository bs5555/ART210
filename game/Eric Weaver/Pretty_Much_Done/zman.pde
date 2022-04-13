 class zman
{
  sprite s;               //zman sprite
  sprite r;               //zman runs
  sprite d;               //zman dead
  sprite j;               //zman jump
  
  int state = 0;          //0 = running, 1 = jumping, 2 = falling -1=dead
  float jumpSpeed = 100;  //starting speed
  float grav = 0;         //local copy of gravity
  float groundLevel = 650; //ground level in pixels for zman

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
    this.d.cx=200;
    this.d.cy=this.groundLevel;
    this.d.speed=1;
    this.d.dir = 180;
    this.d.acceleration = 2;
    this.s = r;
    
    this.j = new sprite();
    this.j.cx=200;
    this.j.cy=this.groundLevel;
    this.j.speed=1;
    this.j.dir = 180;
    this.j.acceleration = 0;
    this.j.loadFrame("character4.png");
    this.j.loadFrame("character4.png");
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
        this.state = 0;
        PImage[] temp = this.s.im;
        this.s.im=this.j.im;
        this.j.im=temp;
        this.s.speed = 0;
        this.s.cy = this.groundLevel;
        jumpCount = 0;
      }
    }
  }
  
  void show()
  {
    
      this.s.step();
      this.s.show();
      if(this.s.cy<-100)gameState=2;
     

    
  }
  
  void jump()
  {
   if(jumpCount<2)
   {
   if(this.state == 0)
    {
      PImage[] temp = this.s.im;
      this.s.im=this.j.im;
      this.j.im=temp;
    }
    this.state = 1;
    this.s.speed = jumpSpeed; 
    this.s.dir = 180.0;
    jumpCount++;
   }
      
    }
  
  void die()
  {
    this.state = -1;
    this.s=this.d;
    jumpCount = 0;
    scoreCount = 0;
    objectSpeed = 15;
  }
}
