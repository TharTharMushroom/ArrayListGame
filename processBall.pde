ArrayList<Ball> balls = new ArrayList<>();
void setup(){
  size(960, 540);
  balls.add(new Ball(200, 200, 60, 5, #FF0000, 30));
}

void draw(){
  background(0);
  drawBalls();
  updateBalls();
}

void drawBalls(){
  for(int i = 0; i<balls.size(); i++){
    balls.get(i).drawBall();
  }
}

void updateBalls(){
  for(int i = 0; i<balls.size(); i++){
    balls.get(i).updatePos(1);
    balls.get(i).bounceOnEdge();
  }
}

void mouseClicked(){
  if(random(1,10)==2){
    balls.add(new SuperBall(mouseX, mouseY));
  } else{
    balls.add(new Ball(mouseX, mouseY, random(30, 80), random(3,7), #FFFFFF, random(0,360)));
  }
}
