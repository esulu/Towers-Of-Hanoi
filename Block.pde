class Block {
  int x; // X-coordinate of the middle of the rectangle 
  int y; // Y-coordinate of the middle of the rectangle 
  int l; // Length of the rectangle
  int w; // Width of the rectangle 
  int c; // Colour of the rectangle 

  // Constructor method which sets the fields of the appropriate disk
  Block(int x, int y, int l, int w, color c) {
    this.x = x;
    this.y = y;
    this.l = l;
    this.w = w;
    this.c = c;
  }

  // Method which displays the current disk 
  void show() {
    fill(c);
    strokeWeight(1);
    rect(x, y, l, w);
  }

  // Method which moves the disk down
  void moveUp() {
    while(!canMoveDown()) {
      y -= 50;
    }
  }

  // Checks if the disk can go down without intersecting with another disk 
  boolean canMoveDown() {
    if (get(x, y) == -16777216) {
      return true;
    } else {
      return false;
    }
  }

  // Method which moves the current disk 
  void move(int pFinal) {
    if (pFinal == 1 && x > 250) { // Moves to the first peg
      x = 250;//x --;
    } else if (pFinal == 2 && x < 750) { // Moves to the second peg from the first peg
      x = 750;//x ++;
    } else if (pFinal == 2 && x > 750) { // Moves to the second peg from the third peg
      x = 750;//x --;
    } else if (pFinal == 3 && x < 1250) { // Moves to the last peg
      x = 1250;//x ++;
    }
    y = 510;
    moveUp();
  }
}