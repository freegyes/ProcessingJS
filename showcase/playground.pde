void setup() {
  size(512, 512);
  background(0);
  noStroke();
}

void draw_circle() {
  int r = random(5,150);
  int x = mouseX;
  int y = mouseY;
  if (random(10)>7) {
    fill(random(256), random(256), random(256));
  }
  ellipse(x, y, r, r);
}

void draw() {
  fill(0, 10);
  rect(0, 0, width, height);
  if (random(10) > 5) {
    draw_circle();
  }
}