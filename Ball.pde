class Ball{
  float x = 100;
  float y = 100;
  float size = 50;
  float minSpeed= 5;
  float curSpeed = 5;
  int ballColor = #FFFFFF;
  float accelX = 0;
  float accelY = 0;
  float velX = 0;
  float velY = 0;
  float angle = radians(0);
  public Ball(){}
  
  public Ball(float x, float y, float size, float minSpeed, int ballColor, float angle){
    this.x=x;
    this.y=y;
    this.size=size;
    this.minSpeed=minSpeed;
    this.curSpeed=minSpeed;
    this.ballColor=ballColor;
    this.angle=radians(angle);
  }
  
  void drawBall(){
    push();
    fill(ballColor);
    ellipseMode(CENTER);
    circle(x,y,size);
    pop();
  }
  
  void updatePos(float gameSpeed){
    velX = cos(angle) * curSpeed;
    velY = sin(angle) * curSpeed;
    x += velX*gameSpeed;
    y += velY*gameSpeed;
  }
  
  void bounceOnEdge(){
    if (x < size/2){
      x = size/2;
      angle = PI - angle;
    }
    if (x > width - size/2){
      x = width - size/2;
      angle = PI - angle;
    }
    if (y < size/2){
      y = size/2;
      angle = -angle;
    }
    if (y > height - size/2){
      y = height - size/2;
      angle = -angle;
  }
}
}

class SuperBall extends Ball{
  public SuperBall(int x, int y){
    super(x, y, 25, 30, #0000FF, random(0,360));  
  }
}
