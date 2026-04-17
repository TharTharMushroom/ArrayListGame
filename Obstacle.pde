class Obstacle{
  float x;
  float y;
  float width;
  float length;
  public Obstacle(){
     this.x = (int)(Math.random() * 1001);
     this.y = (int)(Math.random() * 1001);
     this.width = (int)(Math.random() * 101);
     this.length = (int)(Math.random() * 101);
     
  }
   public Obstacle(float x, float y, float width, float length) {
     this.x = x;
     this.y =y;
     this.width = width;
     this.length =length;
    }
    void drawObstacle(){
      rect(x, y, width, length);
      
    }
    
}
