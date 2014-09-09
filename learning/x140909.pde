// declare variables
float x1 = 0;
float h1 = 0;
float s1 = 0;
float b1 = 0;
// choose a random color
float h = random(256);
float s = random(256);
float b = random(256);

void setup() {
  size(512, 512); // set the canvas size
  colorMode(HSB); // change from RGB to HSB
}

void draw() {
  stroke(h, s, b1);                       // lock hue and saturation, change brightness
  line(x1, 0, x1, (height / 3) - 1);      // draw lines in the upper third
  stroke(h, s1, b);                       // change saturation
  line(x1, (height / 3), x1, (2 * height / 3) - 1); //draw in the center third
  stroke(h1, s, b);                       // change hue
  line(x1, (2 * height / 3), x1, height); // draw in the bottom third
  // change hue, saturation and brightness with each iteration;
  h1 +=0.5;
  s1 +=0.5;
  b1 +=0.5;
  // move the line right
  x1 +=1;

}