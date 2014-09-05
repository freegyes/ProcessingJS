void setup() {
  size(512, 512);
  frameRate(30); // slows down the fps
  background(random(256), 60); // sets a random grey back
}

void draw() {
  float r = random(256); // stores a random number
  float g = random(256); // stores a random number
  stroke(r, g, 0); // gives a random green
  line(256, 256, r*2, g*2); // draws lines randomly from center and distributes by color on Y axis
}