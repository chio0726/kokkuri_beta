import fullscreen.*;
FullScreen fs; 

void setup() {
  fs = new FullScreen(this);
  
  fs.enter(); 

  // the background image
  PImage sheet;
  sheet = loadImage("kokkuri_sheet.jpg");
  
  // set your display size
  size( 1280, 800);
  // for debug
  //size( 320, 200);
  colorMode(RGB, 255);
  frameRate(32);
  background(sheet);
  PFont font;
  font = loadFont("font.vlw"); 
  fill(0);
  textFont(font, 16); 
  noCursor();
}

int buf = 1;
int output = 0;
int flag = 0;
String url;

void draw() {
  PImage sheet;
  sheet = loadImage("kokkuri_sheet.jpg");
  // rerfresh background image
  background(sheet);
  PImage coin;
  coin=loadImage("yen_s.png");

  // draw the coin
  image( coin, mouseX-coin.width/3, mouseY-coin.height/3, coin.width/1.5, coin.height/1.5);

  // if the coin keeps in a certain spot
  if (dist(pmouseX, pmouseY, mouseX, mouseY) < 5) {
    // incliment the flag
    flag++;
  }
  else {
    flag = 0;
  }

  // called when the coin stopped for certain secs(change the value '7' below as you like)
  if( flag > 7) {
    flag = 0;
    output = outPut( pmouseX, pmouseY);
    // check the current chara is not the same as the previous one
    if ( buf != output) {
      // set buf the current chara
      buf = output;
      url = "your/path/to/script/index.php?kokkuri=" + output;

      // PUT the chara value to the php program
      link(url);
      PImage byakko = loadImage("byakko.png");
      image( byakko, width/2-(byakko.width/2), 0);
      print("**stopped"+output+"**");
    }
  }
  print(flag + ":");
}

// get the x,y and returns the chara num
int ret;
int outPut(int x,int  y) {
  x = constrain(x, 0, width);
  y = constrain(y, 0, height);
  x /= (width/10);
  y /= (height/10);
  ret = x*10 + y;
  return  ret;
}

void keyPressed()
{
  if (key == 'q') {
    exit();
  }
}
