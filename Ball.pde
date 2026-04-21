class Ball{
  float x = 100;
  float y = 100;
  float size = 50;
  float minSpeed = 5;
  float curSpeed = 5;
  int ballColor = #FFFFFF;
  float velX = 0;
  float velY = 0;
  float angle = radians(0);
  
  // 1. Declare the Arrow object
  Arrow directionArrow;

  public Ball() {
    // 2. Initialize the arrow (adjusting size so it looks like a small indicator)
    directionArrow = new Arrow(x, y, 10, 30, 0);
  }

  public Ball(float x, float y, float size, float minSpeed, int ballColor, float angle) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.minSpeed = minSpeed;
    this.curSpeed = minSpeed;
    this.ballColor = ballColor;
    this.angle = radians(angle);
    
    // Initialize the arrow with a width and length proportional to the ball
    directionArrow = new Arrow(x, y, size/5, size/1.5, 0);
  }

  void drawBall() {
    // 3. Update the arrow's rotation and location before drawing
    // We subtract 90 because your Arrow class's default "up" is 0 degrees
    directionArrow.angle = degrees(angle) - 90; 
    
    // Center the arrow on the ball's center
    float arrowX = x - (directionArrow.rectWidth / 2);
    float arrowY = y - (directionArrow.rectLength / 2);
    directionArrow.setLocation(arrowX, arrowY);
    
    directionArrow.drawArrow();

    push();
    fill(ballColor);
    ellipseMode(CENTER);
    circle(x, y, size);
    pop();
  }

  void updatePos(float gameSpeed) {
    velX = cos(angle) * curSpeed;
    velY = sin(angle) * curSpeed;
    x += velX * gameSpeed;
    y += velY * gameSpeed;
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

void bounceOnObstacle(float obsX, float obsY, float obsW, float obsH) {
  // Check if the ball is within the horizontal and vertical bounds of the obstacle
  if (x + size/2 > obsX && x - size/2 < obsX + obsW &&
      y + size/2 > obsY && y - size/2 < obsY + obsH) {
    
    // Check if the ball hit the left or right sides
    // We check if the ball's center is roughly aligned with the side walls
    if (x < obsX || x > obsX + obsW) {
      angle = PI - angle;
    }
    
    // Check if the ball hit the top or bottom sides
    // We check if the ball's center is roughly aligned with the top or bottom
    if (y < obsY || y > obsY + obsH) {
      angle = -angle;
    }
    
    // Optional: Slight "nudge" to prevent the ball from getting stuck inside the obstacle
    // x += cos(angle) * speed; 
    // y += sin(angle) * speed;
  }
}
}

class SuperBall extends Ball{
  public SuperBall(int x, int y){
    super(x, y, 25, 20, #0000FF, random(0,360));  
  }
}
