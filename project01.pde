int[][] grasscol = {{27, 94, 32}, {85, 139, 47}, {46, 125, 50}};
float[][] xy = new float[7][2];
int timer;

PImage[] FlowerList = new PImage[4];
PImage[] cloverList = new PImage[2];
PImage[] butterList = new PImage[3];
PImage[] butterList2 = new PImage[7];
int cntf1 = 0;
int pretimer=0;

PFont font;
int[] speed= new int[7];
boolean[] isbigger = new boolean[7];
int buttercnt = 0;

String ment = "Flower & Butterfly";

void setup(){
  size(800, 800);
  background(156, 204, 101);
  smooth();
  FlowerList[0] = (loadImage("jasmine.png"));
  FlowerList[1] = (loadImage("oleander.png"));
  FlowerList[2] = (loadImage("hypericum.png"));
  FlowerList[3] = (loadImage("cherry_blossom.png"));
  
  cloverList[0] = (loadImage("clover.png"));
  cloverList[1] = (loadImage("clover2.png"));
  
  butterList[0] = (loadImage("butterfly1.png"));
  butterList[1] = (loadImage("butterfly2.png"));
  butterList[2] = (loadImage("butterfly3.png"));
  
  font = createFont("Sunshine.ttf", 100);
  textFont(font);
  
  for(int i=0; i<7; i++){
    isbigger[i] = true;
    speed[i] = 40;
    butterList2[i] = butterList[int(random(0,3))];
  }
}

void draw(){
  timer = millis();
  strokeWeight(3);
  
  if(timer<21 * 1000){
    if(cntf1 %50 ==0){
      Clover();
    }
    drawgrass();
    cntf1++;
  }else if(timer>21 * 1000 && timer<25500){
    Flower();
  }else if(timer>25500 && timer<26*1000){
    text(ment, 100, 700);
  }else if(timer>26*1000 && timer < 26500){
    save("background.png");
  }else{
    if(buttercnt>=1 && buttercnt<=7){
      Butterfly();
    }
  }
}

void drawgrass(){
  float grasslen = random(25,35);
  float x = random(800);
  float y = random(800);
  int cnt = int(random(2,5));
  int col = int(random(0,3));
  grass(x, y, grasslen, cnt, col);
}

void grass(float x, float y, float grasslen, int cnt, int col){
  stroke(grasscol[col][0], grasscol[col][1], grasscol[col][2]);
  float partlen = grasslen/2;
  if(cnt==2){
    line(x, y, x, y - partlen);
    line(x, y - partlen, x-10, y - partlen - (sqrt(pow(partlen,2)-pow(10,2))));
    float temp = y - partlen - (sqrt(pow(partlen,2)-pow(10,2)));
    line(x-10, temp, x-18, temp + (sqrt(pow(partlen,2)-pow(8,2))));
    
    line(x+4, y, x+4, y - partlen);
    line(x+4, y -  partlen, x+4-5, y - partlen - (sqrt(pow(partlen,2)-pow(5,2))));
    float temp2 = y - partlen - (sqrt(pow(partlen,2)-pow(5,2)));
    line(x+4-5, temp2, x+4-5-5, temp2 - (sqrt(pow(partlen,2)-pow(8,2))));
  }else if(cnt==3){
    grass(x, y, grasslen, 2, col);
    line(x+8, y, x+8, y - partlen);
    line(x+8, y - partlen, x+8+5, y - partlen - (sqrt(pow(partlen,2)-pow(5,2))));
    float temp3 = y - partlen - (sqrt(pow(partlen,2)-pow(5,2)));
    line(x+8+5, temp3, x+8+5+10, temp3 - (sqrt(pow(partlen,2)-pow(10,2))));
  }else{
    grass(x, y, grasslen, 2, col);
    line(x+8, y, x+8, y - partlen);
    line(x+8, y - partlen, x+8+3, y - partlen - (sqrt(pow(partlen,2)-pow(3,2))));
    float temp3 = y - partlen - (sqrt(pow(partlen,2)-pow(3,2)));
    line(x+8+3, temp3, x+8+3+10, temp3 - (sqrt(pow(partlen,2)-pow(10,2))));
    
    line(x+12, y, x+12, y - partlen);
    line(x+12, y - partlen, x+12+10, y - partlen - (sqrt(pow(partlen,2)-pow(10,2))));
    float temp4 = y - partlen - (sqrt(pow(partlen,2)-pow(10,2)));
    line(x+12+10, temp4, x+12+10+8, temp4 + (sqrt(pow(partlen,2)-pow(8,2))));
  }
}

void Flower(){
  float len = random(20, 30);
  PImage img = FlowerList[int(random(0,4))];
  image( img,random(800), random(800), len, len);
}

void mouseClicked(){
  if(buttercnt<7){
    xy[buttercnt][0] = mouseX;
    xy[buttercnt][1] = mouseY;
    buttercnt++;
  }
}

void Clover(){
  float len = random(30, 35);
  PImage img = cloverList[int(random(0,2))];
  image( img, random(800), random(800), len, len);
}

void Butterfly(){
  background(loadImage("background.png"));
  imageMode(CENTER);
  for(int i=0; i<buttercnt; i++){
    image(butterList2[i], xy[i][0], xy[i][1], speed[i], 50);
  }
  
  for(int i=0; i<buttercnt; i++){
    if(isbigger[i]==true){
      speed[i] += int(random(4,7));
      if(speed[i]>=70){
        isbigger[i] = false;
      }
    }else if(isbigger[i]==false){
      speed[i] -= int(random(4,7));
      if(speed[i]<=40){
        isbigger[i] = true;
      }
    }
  }
}
