class Player {

  float xPos, yPos;
  float radius;

  Player(float xPos, float yPos, float radius) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.radius = radius;
  }

  void display() {
    fill(0, 255, 0);
    noStroke();
    rect(xPos, yPos, radius*2, radius*2);
  }

  void move() {
    if (keyPressed) {
      if (key == 'd' || key == 'D') {
        if (xPos < width-radius) {
          xPos += 4;
        }
      } else if (key == 'a' || key == 'A') {
        if (xPos > radius) {
          xPos -= 4;
        }
      } else if (key == 'w' || key == 'W') {
        if (yPos > radius) {
          yPos -= 4;
        }
      } else if (key == 's' || key == 'S') {
        if (yPos < height-radius) {
          yPos += 4;
        }
      }
    }
  }

  boolean collideWithEnemy(Enemy enemy) {
    if (xPos-radius < enemy.xPos+enemy.radius && xPos+radius > enemy.xPos-enemy.radius &&
      yPos-radius < enemy.yPos+enemy.radius && yPos+radius > enemy.yPos-enemy.radius) {
      return true;
    }
    return false;
  }

  boolean collideWithBarrier(Barrier barrier) {
    if (xPos-radius <= barrier.xPos1-barrier.thickness/2 && xPos+radius >= barrier.xPos1+barrier.thickness/2
      && yPos+radius >= barrier.yPos1-barrier.thickness/2 && yPos-radius <= barrier.yPos2+barrier.thickness/2) {
      return true;
    }
    return false;
  }

  boolean collideWithFinishLine() {
    if (xPos-radius < 875+125 && xPos+radius > 875-125 &&
      yPos-radius < height-80+25 && yPos+radius > height-80-25) {
      return true;
    }
    return false;
  }
}
