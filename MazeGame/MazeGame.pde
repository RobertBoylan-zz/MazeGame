Player player;
float playerRadius;
float playerXPos;
float playerYPos;

ArrayList<Barrier> barrierList;
float barrierGap = 200;

ArrayList<Enemy> enemyList;

boolean win = false;

void setup() {
  size(1000, 1000); 

  textAlign(CENTER);
  rectMode(CENTER);

  playerRadius = 25;
  playerXPos = 125;
  playerYPos = height-playerRadius-20;

  player = new Player(playerXPos, playerYPos, playerRadius);

  barrierList = new ArrayList<Barrier>();
  barrierList.add(new Barrier(250, barrierGap, 250, height));
  barrierList.add(new Barrier(500, 0, 500, height-barrierGap));
  barrierList.add(new Barrier(750, barrierGap, 750, height));

  enemyList = new ArrayList<Enemy>();
  enemyList.add(new Enemy(4, 350, 4, 4, 250-8));
  enemyList.add(new Enemy(504, 600, 4, 504, 750-8));
}

void draw() {
  background(255);

  if (!win) {

    player.display();
    player.move();

    for (int i=barrierList.size()-1; i>=0; i--) {
      barrierList.get(i).display();
      if (player.collideWithBarrier(barrierList.get(i))) {
        restart();
      }
    }

    for (int i=enemyList.size()-1; i>=0; i--) {
      enemyList.get(i).display();
      enemyList.get(i).move();
      enemyList.get(i).changeDirection();

      if (player.collideWithEnemy(enemyList.get(i))) {
        restart();
      }
    }

    drawFinishLine();
    win();
  } else {
    fill(0, 122, 0);
    textSize(50); 
    text("You Win!", width/2, height/2);
  }
}

void drawFinishLine() {
  fill(255, 255, 0);
  noStroke();
  rect(877, height-80, 250, 50) ;
}

void win() {
  if (player.collideWithFinishLine()) {
    win = true;
  }
}

void restart() {
  player.xPos = 125;
  player.yPos = height-playerRadius-20;
}
