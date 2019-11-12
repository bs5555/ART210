//Maze settings ----------------------------------------------
int s = 30; //number of cells by the height of the app
int MAZE_X, MAZE_Y; //width and height of the mase in cells
float CELLSIZE;     //side of a cell (square)
float WALLSIZE;     //wall stroke
bsMaze maze;


//Game globals - nothing to change
ArrayList<cell> grid = new ArrayList<cell>();
player player;

void setup() 
{
  size(1200, 900);
  //fullScreen();
  CELLSIZE = height / (s * 1.0);
  WALLSIZE = CELLSIZE / 5.0;
  MAZE_X = (int)(width / CELLSIZE);
  MAZE_Y = (int)(height / CELLSIZE);
  
  maze = new bsMaze(MAZE_X,MAZE_Y);
  player = new player(1,1);
}

void draw() {
  background(0);
  stroke(255);
  fill(255);
  translate(-WALLSIZE/2,-WALLSIZE/2);
  for(int c = 0; c < grid.size(); c++)
  {
    cell buf1 = grid.get(c);
    buf1.drawMe();
  }  
  player.drawMe();
}


class player
{
  int x =1;
  int y =1;
  
  player(int sx, int sy)
  {
    this.x=sx;
    this.y=sy;
  }
  
  void drawMe()
  {
    noStroke();
    float d = CELLSIZE-WALLSIZE;  
    //rect((this.x*CELLSIZE)+WALLSIZE,(this.y*CELLSIZE)+WALLSIZE,d,d);
    fill(10,120,255);
    ellipse((this.x*CELLSIZE)+WALLSIZE+d/2,(this.y*CELLSIZE)+WALLSIZE+d/2,d-WALLSIZE*2,d-WALLSIZE*2);
  }
  
  void moveMe(String dir)
  {
    int cellnum = this.x*MAZE_Y+this.y;
    cell buf = grid.get(cellnum);
    //buf.test=true;
    //grid.set(cellnum,buf);
    int dx = 0;
    int dy = 0;
    switch(dir)
    {
      case "left" :  if(buf.left)   dx=-1; break;
      case "right" : if(buf.right)  dx= 1; break;
      case "up" :    if(buf.top)    dy=-1; break;
      case "down" :  if(buf.bottom) dy= 1; break;
    }
    this.x=this.x+dx;
    this.y=this.y+dy;
  }
}

class cell
{
  int x;
  int y;
  boolean top = true;
  boolean left = true;
  boolean right = true;
  boolean bottom = true;
  boolean test =  false;
  
  cell(int xx,int yy)
  {
    this.x=xx;
    this.y=yy;
  }
  
  boolean drawMe()
  {
    if(this.x==0) return(false);
    if(this.y==0) return(false);
    if(this.x==MAZE_X-1) return(false);
    if(this.y==MAZE_Y-1) return(false);
    
    float sx = this.x*CELLSIZE;
    float sy = this.y*CELLSIZE;
    float w = CELLSIZE+WALLSIZE;
    float h = CELLSIZE+WALLSIZE;
    float s = WALLSIZE;
    
    noStroke();
    if(this.test)
    {
      fill(color(100,200,300,150));
      rect(sx,sy,w,h);
    }  
    fill(color(150,0,0));
    if(!this.top)     rect(sx,sy,w,s);
    if(!this.left)    rect(sx,sy,s,w);
    if(!this.bottom)  rect(sx,sy+CELLSIZE,w,s);
    if(!this.right)   rect(sx+CELLSIZE,sy,s,w);
    return(true);
  }
}

void keyPressed()
{
  println(keyCode);
  if(keyCode==UP)    player.moveMe("up");
  if(keyCode==DOWN)  player.moveMe("down");
  if(keyCode==LEFT)  player.moveMe("left");
  if(keyCode==RIGHT) player.moveMe("right");
}
