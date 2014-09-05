void setup() {
  size(512, 512);
  background(#ff00ff, 60);
}

void draw() {
  line(256, 256, random(512), random(512));
}