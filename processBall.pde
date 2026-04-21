ArrayList<Ball> balls = new ArrayList<>();
ArrayList<Obstacle> obstacles = new ArrayList<>();
float time = 1;
int placeMode = 1;
void setup(){
  size(960, 540);
  balls.add(new Ball(200, 200, 60, 5, #FF0000, 30));
  obstacles.add(new Obstacle(400, 300, 150, 150));
}

void draw(){
  background(0);
  updateBalls();
  drawObstacles();
  drawBalls();
}

void drawBalls(){
  for(int i = 0; i<balls.size(); i++){
    balls.get(i).drawBall();
  }
}

void drawObstacles(){
  for(int i = 0; i<obstacles.size(); i++){
    obstacles.get(i).drawObstacle();
  }
}

void updateBalls(){
  for(int i = 0; i<balls.size(); i++){
    balls.get(i).updatePos(time);
    balls.get(i).bounceOnEdge();
    for(int j = 0; j<obstacles.size(); j++){
      balls.get(i).bounceOnObstacle(obstacles.get(j).x, obstacles.get(j).y, obstacles.get(j).w, obstacles.get(j).l);
    }
  }
}

void mouseClicked(){
  if(placeMode==1){
  if(int(random(1,10))==2){
    balls.add(new SuperBall(mouseX, mouseY));
  } else{
    balls.add(new Ball(mouseX, mouseY, random(30, 80), random(3,7), #FFFFFF, random(0,360)));
  }
  }else if(placeMode ==2){
    obstacles.add(new Obstacle(mouseX, mouseY, random(50,200), random(50,200)));
  }
}

void keyPressed() {
  if (key == ' ') {
    time = (time==1) ? 0.3 : 1;
  }

  // Check for Coded keys (Arrows, Shift, Alt, etc.)
  if (key == CODED) {
    if (keyCode == LEFT) {
      placeMode=1;
    } else if (keyCode == RIGHT) {
      placeMode = 2;
    }
  }
}
