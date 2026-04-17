Obstacle randomObstacle;
Obstacle specificObstacle;
Arrow followerArrow;
Arrow centerArrow;
void setup() {
  fullScreen();
  
  randomObstacle = new Obstacle(); 
  specificObstacle = new Obstacle(100, 100, 200, 50); 
  
  followerArrow = new Arrow(0, 0, 15, 60, 0); 
  centerArrow = new Arrow(385, 260, 30, 80, 0);
}

void draw() {
  background(0); 
  fill(255, 0, 0); 
  randomObstacle.drawObstacle();
  fill(0, 0, 255); 
  specificObstacle.drawObstacle();
  followerArrow.setLocation(mouseX - followerArrow.rectWidth/2, mouseY - followerArrow.rectLength/2);
  centerArrow.aimAt(mouseX, mouseY); 
  fill(0, 200, 0);
  followerArrow.drawArrow();
  fill(255, 0, 0); 
  centerArrow.drawArrow();
}
