class Barrier {

  float xPos1, yPos1, xPos2, yPos2;
  int thickness = 4;

  Barrier(float xPos1, float yPos1, float xPos2, float yPos2) {
    this.xPos1 = xPos1;
    this.yPos1 = yPos1;
    this.xPos2 = xPos2;
    this.yPos2 = yPos2;
  }

  void display() {
    stroke(255,0,0);
    strokeWeight(thickness);
    line(xPos1, yPos1, xPos2, yPos2);
  }
}
