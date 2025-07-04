import oscP5.*;
import netP5.*;
import java.util.Arrays;
float[] inputs = new float[2]; // Wekinator에 전송할 2개의 입력 값의 배열
float[] wekinatorOutputs = new float[2]; // Wekinator의 출력값 저장하는 배열
OscP5 oscP5FaceOSC; // faceOSC 입력 데이터
OscP5 oscP5Wekinator; // Wekinator 출력 데이터
NetAddress wekinatorAddress; 

PImage[] images;
PGraphics source;
PGraphics target;
PGraphics result;
PImage buffer_target, buffer_result;
PImage currImage, finalImage;
PImage captureImage;
boolean smile = true;//0 - smile, 1 - nonsmile

int Poster_W = 500;
int Poster_H = 450;
float Tiles_X = Poster_W/5;
float Tiles_Y = Poster_H/5;
int sx, sy, sw, sh, dx, dy, dw, dh;
float scalar = 1;

color buttonColor = color(0);
color textColor = color(255);
boolean drawingFinished = false;

void setup(){
  size(1000, 450);
  
  frameRate(25);
  oscP5FaceOSC = new OscP5(this, 8338);
  oscP5Wekinator = new OscP5(this, 12000);
  wekinatorAddress = new NetAddress("127.0.0.1", 6448);
  
  source = createGraphics(Poster_W, Poster_H);
  target = createGraphics(Poster_W, Poster_H);
  images = new PImage[4];
  images[0] = loadImage("1.png");
  images[1] = loadImage("2.png");
  images[2] = loadImage("3.png");
  images[3] = loadImage("4.png");
  currImage = images[0];
}

void draw(){
  background(0);
  drawSource();
  drawTarget();
  
  image(source, 0, 0);
  image(target, Poster_W, 0);
  
  //Image 범위 표시
  noFill();
  stroke(255);
  strokeWeight(4);
  if(mouseX > 500){
    noStroke();
  }
  rect(mouseX, mouseY, sw, sh);
  
  // Finish Drawing 버튼
  fill(buttonColor);
  rect(455, 430, 90, 20);
  fill(textColor);
  textAlign(CENTER, CENTER);
  textSize(11);
  text("Finish Drawing", 500, 440);
  
  if (drawingFinished && smile == false) {
    captureImage = get(Poster_W, 0, 999, 449);
    finalImage = captureImage.copy();
    image(finalImage, 0, 0);
    finalImage.filter(GRAY);
    image(finalImage, Poster_W, 0);
    noLoop();
  }
}

void mousePressed() {
  if (mouseX > 455 && mouseX < 545 && mouseY > 430 && mouseY < 450) {
    drawingFinished = true;
  }
}

void oscEvent(OscMessage m) {
  try {
    if (m.addrPattern().equals("/wek/outputs")) {
      if (m.typetag().length() == wekinatorOutputs.length) {
        for (int i = 0; i < m.typetag().length(); i++) {
          if (i < wekinatorOutputs.length) { // 배열 인덱스 유효한지 확인
            wekinatorOutputs[i] = m.get(i).floatValue();
          }
          if (wekinatorOutputs[1] > 0.8) { // NonSmile
            smile = false;
          }
        }
      }
    }

    if (m.addrPattern().equals("/gesture/mouth/width")) {
      if (m.checkTypetag("f")) { // 입력값이 있는지 확인
        inputs[0] = m.get(0).floatValue(); // 첫 번째 입력 값
        sendToWekinator(inputs);
      }
    } else if (m.addrPattern().equals("/gesture/mouth/height")) {
      if (m.checkTypetag("f")) { // 입력값이 있는지 확인
        inputs[1] = m.get(0).floatValue(); // 두 번째 입력 값
        sendToWekinator(inputs);
      }
    }
  } catch (NullPointerException e) {
    e.printStackTrace();
  } catch (IndexOutOfBoundsException e) {
    e.printStackTrace();
  } catch (Exception e) {
    e.printStackTrace();
  }
}

void sendToWekinator(float[] inputs) {
  OscMessage toWekinator = new OscMessage("/wek/inputs");
  for (int i = 0; i < inputs.length; i++) {
    toWekinator.add(inputs[i]);
  }
  oscP5FaceOSC.send(toWekinator, wekinatorAddress);
}

void drawSource(){
  source.beginDraw();
  source.background(150);
  source.imageMode(CENTER);
  source.push();
  source.translate(source.width/2, source.height/2);
  source.scale(scalar);
  //currImage.filter(GRAY);
  source.image(currImage, 0, 0);
  source.pop();
  source.endDraw();
}

void drawTarget(){
  target.beginDraw();
  
  buffer_target = source.get();
  
  if(frameCount == 1){
    target.background(255);
  }
  
  sx = mouseX;
  sy = mouseY;
  sw = 50;
  sh = 50;
    
  dx = mouseX;
  dy = mouseY;
  dw = 50;
  dh = 50;
    
  if(mousePressed){
    target.copy(buffer_target, sx, sy, sw, sh, dx, dy, dw, dh);
  }
  target.endDraw();
}

void keyReleased(){
  if(key == '1'){
    currImage = images[0];
  }
  if(key == '2'){
    currImage = images[1];
  }  
  if(key == '3'){
    currImage = images[2];
  }  
  if(key == '4'){
    currImage = images[3];
  }
  if(key == 'p'){//plus
    scalar++;
  }
  if(key == 'm'){//minus
    scalar--;
  }
}
