/* ICS4U
 Towers of Hanoi visualized 
 Made by Eren Sulutas
 04/20/2018
 */

int disk;
Block[] block;
ArrayList<Integer>order = new ArrayList<Integer>();
boolean menu = true;
boolean endLoop = false;
int hanoi = 0;
int i = 0;

// Method that removes the menu GUI
void reset() {
  menu = false;
  setup();
}

void setup() {
  size(1500, 720);
  block = new Block[disk];
  rectMode(CENTER);
  for (int i = 0; i < disk; i ++) { // Initializes the disk objects 
    color c = color(255 - i*10, i*40, i*20);
    block[i] = new Block(250, 560 + (i*50) - disk*50, 50+40*i, 50, c);
  }
}

void hanoi(int n, int pInitial, int pFinal, int pTemp) {
  if (n == 0) { // Only one disk is to be moved
    order.add(0); // Puts instructions to move the first disk in the arraylist
    order.add(pFinal);
  } else { // More than one peg has to be moved, the process needs to be broken down to smaller parts
    hanoi(n-1, pInitial, pTemp, pFinal);
    order.add(n); // Puts instructions to move current disk in the arraylist
    order.add(pFinal);
    hanoi(n-1, pTemp, pFinal, pInitial);
  }
}

// Displays the pegs
void peg() {
  stroke(0);
  for (int i = 0; i <= 2; i++) {
    fill(0);
    strokeWeight(10);
    line(250 + (i*500), 185, 250 + (i*500), 535);
    line(100 + (i*500), 535, 400 + (i*500), 535);
  }
}

// Moves the disks
void moveDisk() {
  for (int i = 0; i <= order.size(); i +=2) {
    if (i >= order.size()) {
      endLoop = true;
    } else {
      println("move disk " + order.get(i) + " to peg " + order.get(i+1));
      block[order.get(i)].move(order.get(i+1));
      displayDisk();
    }
  }
}

void draw() {
  background(255);

  if (menu) {
    textAlign(CENTER);
    textSize(70);
    fill(255, 0, 0);
    text("Towers of Hanoi", 750, 200);
    textSize(40);
    text("3 Blocks", 550, 400);
    text("4 Blocks", 550, 500);
    text("5 Blocks", 950, 400);
    text("6 Blocks", 950, 500);
    rectMode(CORNER);
    line(450, 200, 1050, 200);
    noFill();
    rect(440, 350, 225, 70);
    rect(440, 450, 225, 70);
    rect(840, 350, 225, 70);
    rect(840, 450, 225, 70);
    stroke(255, 0, 0);
  } else {
    peg();
    displayDisk();
    if (hanoi == 0) { // Ensures the recursion only happened once 
      hanoi(disk-1, 1, 3, 2);
      hanoi++;
    }
    if (i < order.size()) {
      println("Move disk " + (order.get(i) + 1) + " to peg " + order.get(i+1)); // Instruction output to the user 
      block[order.get(i)].move(order.get(i+1));
      i += 2;
    }
    delay(500);
  }
}

// Method that determines the amount of disks the user wants 
void mousePressed() {
  if (button1() && menu) {
    disk = 3;
    reset();
  } else if (button2() && menu) {
    disk = 4;
    reset();
  } else if (button3() && menu) {
    disk = 5;
    reset();
  } else if (button4() && menu) {
    disk = 6;
    reset();
  }
}

void displayDisk() {
  for (Block currentDisk : block) { 
    currentDisk.show();
  }
}

boolean button1 () { 
  if (mouseX >= 450 && mouseX <= 675 && mouseY >= 350 && mouseY <= 420) {
    return true;
  } else {
    return false;
  }
}

boolean button2 () { 
  if (mouseX >= 450 && mouseX <= 675 && mouseY >= 450 && mouseY <= 520) {
    return true;
  } else {
    return false;
  }
}

boolean button3 () { 
  if (mouseX >= 840 && mouseX <= 1065 && mouseY >= 350 && mouseY <= 420) {
    return true;
  } else {
    return false;
  }
}

boolean button4 () { 
  if (mouseX >= 840 && mouseX <= 1065 && mouseY >= 450 && mouseY <= 520) {
    return true;
  } else {
    return false;
  }
}