class Obstacle{
  float x;
  float y;
  float w;
  float l;
  public Obstacle(){
     this.x = (int)(Math.random() * 1001);
     this.y = (int)(Math.random() * 1001);
     this.w = (int)(Math.random() * 101);
     this.l = (int)(Math.random() * 101);
     
  }
   public Obstacle(float x, float y, float w, float l) {
     this.x = x;
     this.y =y;
     this.w = w;
     this.l =l;
    }
    void drawObstacle(){
      rect(x, y, w, l);
      
    }
    
}
