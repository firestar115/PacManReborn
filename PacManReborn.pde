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

PImage toprightcorner;
PImage topleftcorner;
PImage bottomrightcorner;
PImage bottomleftcorner;

PImage i;
PImage o;
PImage j;
PImage n;
PImage k;
PImage m;

PImage ghostwall;
PImage ghostwallleft;
PImage ghostwallright;
PImage ghosttop;
PImage ghosttopleft;
PImage ghostleft;
PImage ghostbottomleft;
PImage ghostbottom;
PImage ghostbottomright;
PImage ghostright;
PImage ghosttopright;

PImage pellet;
PImage powerpellet;

PImage[][] pacmansprites; // 2d array, one dimension for direction and other for animation
PImage[][] blinkysprites;
PImage[][] inkysprites;
PImage[][] pinkysprites;
PImage[][] clydesprites;

PacMan player;
Ghost blinky;
Ghost inky;
Ghost pinky;
Ghost clyde;

String[] map1rows;

void settings() {
  size(224 * res, 288 * res);
  noSmooth();
}

void setup() {
  map1rows = loadStrings("map1.prm");
  
  board = loadImage("board.png");
  
  topbound = loadImage("topbound.png");
  topleftbound = loadImage("topleftbound.png");
  leftbound = loadImage("leftbound.png");
  bottomleftbound = loadImage("bottomleftbound.png");
  bottombound = loadImage("bottombound.png");
  bottomrightbound = loadImage("bottomrightbound.png");
  rightbound = loadImage("rightbound.png");
  toprightbound = loadImage("toprightbound.png");
  
  topwall = loadImage("topwall.png");
  topleftwall = loadImage("topleftwall.png");
  leftwall = loadImage("leftwall.png");
  bottomleftwall = loadImage("bottomleftwall.png");
  bottomwall = loadImage("bottomwall.png");
  bottomrightwall = loadImage("bottomrightwall.png");
  rightwall = loadImage("rightwall.png");
  toprightwall = loadImage("toprightwall.png");
  
  toprightcorner = loadImage("toprightcorner.png");
  topleftcorner = loadImage("topleftcorner.png");
  bottomleftcorner = loadImage("bottomleftcorner.png");
  bottomrightcorner = loadImage("bottomrightcorner.png");
  
  i = loadImage("i.png");
  o = loadImage("o.png");
  j = loadImage("j.png");
  n = loadImage("n.png");
  k = loadImage("k.png");
  m = loadImage("m.png");
  
  ghostwall = loadImage("ghostwall.png");
  ghostwallleft = loadImage("ghostwallleft.png");
  ghostwallright = loadImage("ghostwallright.png");
  ghosttop = loadImage("ghosttop.png");
  ghosttopleft = loadImage("ghosttopleft.png");
  ghostleft = loadImage("ghostleft.png");
  ghostbottomleft = loadImage("ghostbottomleft.png");
  ghostbottom = loadImage("ghostbottom.png");
  ghostbottomright = loadImage("ghostbottomright.png");
  ghostright = loadImage("ghostright.png");
  ghosttopright = loadImage("ghosttopright.png");
  
  pellet = loadImage("pellet.png");
  powerpellet = loadImage("powerpellet.png");
  
  pacmansprites = new PImage[4][4];
  blinkysprites = new PImage[4][2];
  inkysprites = new PImage[4][2];
  pinkysprites = new PImage[4][2];
  clydesprites = new PImage[4][2];
  
  for(int dir = 0; dir < 4; dir++) {
    blinkysprites[dir][0] = loadImage("blinky"+dir+"0.png");
    blinkysprites[dir][1] = loadImage("blinky"+dir+"1.png");
    inkysprites[dir][0] = loadImage("inky"+dir+"0.png");
    inkysprites[dir][1] = loadImage("inky"+dir+"1.png");
    pinkysprites[dir][0] = loadImage("pinky"+dir+"0.png");
    pinkysprites[dir][1] = loadImage("pinky"+dir+"1.png");
  }
  
  blinky = new Ghost() {
    
    public Tile targetTile(Ghost[] ghosts, PacMan player, int gameTime) {
      return player.getTile();
    }
    
    public Tile getDefaultTile() {
      int x = 13;
      int y = 11;
      SEARCH: for(int row = 0; row < map1rows.length; row++) {
        for(int column = 0; column < map1rows[row].length(); column++) {
          if(map1rows[row].toCharArray()[column] == '&') {
            x = column;
            y = row;
            break SEARCH;
          }
        }
      }
      return new Tile(x, y);
    }
    
  };
}

int gameTime = 0;

void draw() {
  background(0);
//  image(board, 0, res * 24, board.width * res, board.height * res);
  for(int row = 0; row < map1rows.length; row++) {
    for(int column = 0; column < map1rows[row].length(); column++) {
      switch(map1rows[row].toCharArray()[column]) {
        case 'T':
          image(topbound, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case 'S':
          image(topleftbound, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case 'L':
          image(leftbound, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case 'D':
          image(bottomleftbound, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case 'B':
          image(bottombound, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case 'F':
          image(bottomrightbound, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case 'R':
          image(rightbound, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case 'A':
          image(toprightbound, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case 't':
          image(topwall, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case '1':
          image(topleftwall, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case 'l':
          image(leftwall, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case '3':
          image(bottomleftwall, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case 'b':
          image(bottomwall, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case '4':
          image(bottomrightwall, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case 'r':
          image(rightwall, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case '2':
          image(toprightwall, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case 'a':
          image(toprightcorner, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case 's':
          image(topleftcorner, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case 'd':
          image(bottomleftcorner, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case 'f':
          image(bottomrightcorner, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case 'i':
          image(i, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case 'o':
          image(o, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case 'j':
          image(j, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case 'n':
          image(n, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case 'k':
          image(k, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case 'm':
          image(m, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case '_':
          image(ghostwall, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case '<':
          image(ghostwallleft, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case '>':
          image(ghostwallright, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case '=':
          image(ghosttop, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case '[':
          image(ghosttopleft, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case ']':
          image(ghosttopright, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case '|':
          image(ghostleft, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case '{':
          image(ghostbottomleft, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case '-':
          image(ghostbottom, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case '}':
          image(ghostbottomright, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case '/':
          image(ghostright, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case 'p':
          image(pellet, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
        case 'P':
          image(powerpellet, column * res * 8, (row + 3) * res * 8, 8 * res, 8 * res);
          break;
      }
    }
  }
  image(blinkysprites[0][gameTime % 2], blinky.getTile().getX() * res * 8, (blinky.getTile().getY() + 3) * res * 8, 16 * res, 16 * res); // TODO Add offset ints for ghosts
  gameTime++;
}

class Tile {
  
  protected int x;
  protected int y;
  
  public Tile(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  public int getX() {
    return x;
  }
  
  public int getY() {
    return y;
  }
  
}

class PacMan {
  
  protected Tile tile;
  protected int tileoffsetx;
  protected int tileoffsety;
  
  protected int direction;
  
  public PacMan() {
    this.tile = new Tile(23, 13);
    this.tileoffsetx = 7;
    this.tileoffsety = 7;
  }
  
  public Tile getTile() {
    return tile;
  }
  
}

abstract class Ghost {
  
  protected Tile tile = getDefaultTile();
  
  public void move(Tile t) {
    this.tile = t;
  }
  
  public abstract Tile targetTile(Ghost[] ghosts, PacMan player, int gameTime);
  
  public abstract Tile getDefaultTile();
  
  public Tile getTile() {
    return tile;
  }
  
}