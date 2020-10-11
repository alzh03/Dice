int numFrames = 6;  // The number of frames in the animation
int currentFrame = 0;
PImage[] images = new PImage[numFrames];

boolean toggleLoop = true;

void setup() {
    size(580, 650);
    frameRate(12);
    
    images[0]  = loadImage("1.png");
    images[1]  = loadImage("2.png"); 
    images[2]  = loadImage("3.png");
    images[3]  = loadImage("4.png"); 
    images[4]  = loadImage("5.png");
    images[5]  = loadImage("6.png"); 
    //noLoop();
  } 
   
  void draw() { 
    background(211);
    int total = 0;
    currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
    
    for (int y = 20; y < 600; y += 200){
      for (int x = 20; x < 600; x += 200){
        Die d = new Die(x, y);
        //println(d.value);
        total += d.value + 1;
        d.show();
      }
    }
    textSize(32);
    fill(0, 102, 153);
    text("Total: " + total, 220, 600); 
  }
  void mousePressed()
  {
    if(toggleLoop){
      noLoop();
    }else{
      loop();
    }
    redraw();
    toggleLoop = !toggleLoop;
  }
  
  class Die{
  int dx, dy, value;
  PImage img;
  
  Die(int x, int y){
    dx = x;
    dy = y;
    
    this.value = (int) (Math.random() * 6);
    this.img = images[this.value];
  }
  
  void show(){
    image(img, dx, dy);
  }
  
}
