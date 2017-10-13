/**
* Simulation of 2D perlin noise creating a mountainy terain 
*/
float yoff = 0;
float downMove=0;
float xInc=0.003;
float yInc = 0.001;

Cloud cloud = new Cloud(50,50,50,50);
Cloud cloud2 = new Cloud(200,50,50,50);


void setup() {
  size(500, 500);
  background(0,0,50,20);
  fill(255);
  ellipse(400,100,50,50);
  fill(255,255,0,150);
  ellipse(400,100,50,50);
  fill(255);
  


}

void draw() {

  noiseDetail(4);
  //cloud.draw();
  //cloud2.draw();
  noiseDetail(256);


  beginShape(); 

  float xoff = 0;    
  
  for (float x = 0; x <= width; x += 1) {
    float y = map(noise(xoff, yoff), 0, 1, 0,height); 
    
    vertex(x, y-downMove); 
    xoff += xInc;
  }
  downMove -= 0.1;
  yoff += yInc;
  float c = noise(xoff,yoff)*255; 
  color r = color(c,c,c,c);
  stroke(r);
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  //filter(BLUR,0.5);
}

class Cloud{
  int xPos;
  int yPos; 
  int cloudWidth;
  int cloudHeight;
  float xoff = 0;
  float yoff = 0;
  float xInc = 0.0005;
  float yInc = 0.0005;   

  public Cloud(int xPos, int yPos, int cloudWidth, int cloudHeight){
    this.cloudWidth = cloudWidth;
    this.cloudHeight = cloudHeight; 
    this.xPos = xPos;
    this.yPos = yPos;
  }
  
  public void draw(){
    beginShape();
    for(int x = 0; x < cloudWidth; x++){
      //yoff = 0;
      for(int y = 0; y< cloudHeight; y++){
          float r = map(noise(xoff,yoff),0,1,0,150);
          stroke(r,r,r,r);

          point(xPos+x,yPos+y);

          stroke(0);
          vertex(xPos+noise(xoff)*cloudWidth,yPos+noise(yoff)*cloudHeight);
          yoff += yInc;          
       }
       xoff += xInc;
    }
    endShape(CLOSE);
  
  }
}