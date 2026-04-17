class Arrow {
  float x;
  float y;
  float rectLength;
  float rectWidth;
  float topPointx;
  float topPointy;
  float rightPointx;
  float rightPointy;
  float leftPointx;
  float leftPointy;
  float angle;
  
  public Arrow() {
     this.x = 200; 
     this.y = 200;
     this.rectWidth = 20;
     this.rectLength = 80;
     this.angle = 0;
     calculateHead();
  }
  
  public Arrow(float x, float y, float w, float l, float angle) {
    this.x = x;
    this.y = y;
    this.rectWidth = w;
    this.rectLength = l;
    this.angle = angle;
    calculateHead();
  }
  
  // NEW: Updates the X and Y coordinates and recalculates the triangle
  void setLocation(float newX, float newY) {
    this.x = newX;
    this.y = newY;
    calculateHead(); 
  }
  
  // NEW: Calculates the angle needed to point at a specific coordinate
  void aimAt(float targetX, float targetY) {
    float centerX = x + (rectWidth / 2);
    float centerY = y + (rectLength / 2);
    
    // atan2 is a math function that finds the angle between two points
    float angleInRadians = atan2(targetY - centerY, targetX - centerX);
    
    // Convert to degrees and add 90 so the top tip points at the target
    this.angle = degrees(angleInRadians) + 90;
  }
  
  void calculateHead() {
    float headHeight = rectLength / 2; 
    float overhang = rectWidth;        
    
    this.topPointx = x + (rectWidth / 2);
    this.topPointy = y - headHeight;
    this.leftPointx = x - overhang;
    this.leftPointy = y;
    this.rightPointx = x + rectWidth + overhang;
    this.rightPointy = y;
  }

  void drawArrow() {
    pushMatrix(); 
    
    float centerX = x + (rectWidth / 2);
    float centerY = y + (rectLength / 2);
    
    translate(centerX, centerY);
    rotate(radians(angle));
    translate(-centerX, -centerY); 
    
    rect(x, y, rectWidth, rectLength);
    triangle(leftPointx, leftPointy, topPointx, topPointy, rightPointx, rightPointy);
    
    popMatrix(); 
  }
}
