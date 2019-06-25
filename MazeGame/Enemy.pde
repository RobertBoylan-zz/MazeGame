class Enemy {

  float xPos, yPos;
  float radius;
  float xMin, xMax;
  boolean moveRight = true;

  Enemy(float xPos, float yPos, float radius, float xMin, float xMax) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.radius = radius;
    this.xMin = xMin;
    this.xMax = xMax;
  }

  void display() {
    noStroke();
    fill(0, 0, 255);
    rect(xPos, yPos, radius*2, radius*2);
  }

  void move() {
    if (moveRight) {
      xPos += 4;
    } else {
      xPos -= 4;
    }
  }
  
  void changeDirection() {
    if(xPos >= xMax) {
      moveRight = false;
    }
    else if(xPos <= xMin) {
      moveRight = true;
    }
  }
}
