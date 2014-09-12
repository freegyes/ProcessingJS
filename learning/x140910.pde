void setup() {
  size(512, 512);
  colorMode(HSB);
  background(random(256), random(50, 100), random(50, 100));
  noFill();
  stroke(255, 100);
}

void draw() {
  fill(#3355CC, 20);
  rect(0,0,width, height);

  float i = 0;
  float center_x = width / 2;
  float center_y = height / 2;

  while (i < 30) {  
    ellipse(center_x, center_y, 100+i*4, 100+i*5);
     center_x = center_x + i/4;
     center_y = center_y - i/8;
    i++;
  }
}

void keyPressed() {
  fill(#FFE200);
  textSize(random(20, 200));
  text(key, random(300), random(100,400));
}