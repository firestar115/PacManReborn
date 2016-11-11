public static final int res = 3;

PImage board;

PImage topbound;
PImage topleftbound;
PImage leftbound;
PImage bottomleftbound;
PImage bottombound;
PImage bottomrightbound;
PImage rightbound;
PImage toprightbound;

PImage topwall;
PImage topleftwall;
PImage leftwall;
PImage bottomleftwall;
PImage bottomwall;
PImage bottomrightwall;
PImage rightwall;
PImage toprightwall;

PImage pellet;
PImage powerpellet;

PImage[][] pacman; // 2d array, one dimension for direction and other for animation
PImage[][] blinky;
PImage[][] inky;
PImage[][] pinky;
PImage[][] clyde;

String[] map1rows;

void settings() {
  size(224 * res, 288 * res);
  noSmooth();
}

void setup() {
  board = loadImage("board.png");
  
  topbound = loadImage("topbound.png");
  topleftbound = loadImage("topleftbound.png");
  leftbound = loadImage("leftbound.png");
  
  topwall = loadImage("topwall.png");
  topleftwall = loadImage("topleftwall.png");
  leftwall = loadImage("leftwall.png");
  
  pellet = loadImage("pellet.png");
  powerpellet = loadImage("powerpellet.png");
  
  pacman = new PImage[4][4];
  blinky = inky = pinky = clyde = new PImage[4][2];
  
  map1rows = loadStrings("map1.prm");
}

void draw() {
  background(0);
  image(board, 0, res * 24, board.width * res, board.height * res);
  for(int row = 0; row < map1rows.length; row++) {
    for(int column = 0; column < map1rows[row].length(); column++) {
      switch(map1rows[row].toCharArray()[column]) {
        case 'T':
          image(topbound, column * res * 8, (row + 3) * res * 8, topbound.width * res, topbound.height * res);
          break;
        case 'S':
          image(topleftbound, column * res * 8, (row + 3) * res * 8, topleftbound.width * res, topleftbound.height * res);
          break;
        case 'L':
          image(leftbound, column * res * 8, (row + 3) * res * 8, leftbound.width * res, leftbound.height * res);
          break;
        case 't':
          image(topwall, column * res * 8, (row + 3) * res * 8, topwall.width * res, topwall.height * res);
          break;
        case '1':
          image(topleftwall, column * res * 8, (row + 3) * res * 8, topleftwall.width * res, topleftwall.height * res);
          break;
        case 'l':
          image(leftwall, column * res * 8, (row + 3) * res * 8, leftwall.width * res, leftwall.height * res);
          break;
        case 'p':
          image(pellet, column * res * 8, (row + 3) * res * 8, pellet.width * res, pellet.height * res);
          break;
        case 'P':
          image(powerpellet, column * res * 8, (row + 3) * res * 8, powerpellet.width * res, powerpellet.height * res);
          break;
      }
    }
  }
}