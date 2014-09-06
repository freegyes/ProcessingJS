color start=color(0,0,0);
color finish;
float amt = 0.0;

void setup() {
 size(400,400);
 background(start); 
 finish = color(random(255),random(255),random(255));
}

void draw() {
 amt+=.01;
 if (amt >= 1) {
   amt = 0.0;
   start = finish;
   finish = color(random(255),random(255),random(255));
 }
 background(lerpColor(start,finish,amt));
}